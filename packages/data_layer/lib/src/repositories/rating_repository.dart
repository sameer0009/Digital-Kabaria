import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ratingRepositoryProvider = Provider<RatingRepository>((ref) {
  return RatingRepository(FirebaseFirestore.instance);
});

class RatingRepository {
  final FirebaseFirestore _firestore;

  RatingRepository(this._firestore);

  CollectionReference get _ratings => _firestore.collection('ratings');

  Future<void> submitRating(Rating rating) async {
    await _ratings.doc(rating.id).set(rating.toJson());
  }

  Stream<List<Rating>> watchUserRatings(String userId) {
    return _ratings
        .where('toUserId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Rating.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }
}
