import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listingRepositoryProvider = Provider<ListingRepository>((ref) {
  return ListingRepository(FirebaseFirestore.instance);
});

class ListingRepository {
  final FirebaseFirestore _firestore;

  ListingRepository(this._firestore);
  
  CollectionReference get _listings => _firestore.collection('listings');

  Future<void> createListing(Listing listing) async {
    await _listings.doc(listing.id).set(listing.toJson());
  }

  Stream<List<Listing>> watchSellerListings(String sellerId) {
    return _listings
        .where('sellerId', isEqualTo: sellerId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Listing.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  Future<Listing?> getListingById(String id) async {
    final doc = await _listings.doc(id).get();
    if (doc.exists && doc.data() != null) {
      return Listing.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Stream<List<Listing>> watchMatchingLeads({List<String>? categories}) {
    var query = _listings.where('status', isEqualTo: 'submitted');
    
    // Note: Firestore 'in' query has limits, but works for MVP categories.
    if (categories != null && categories.isNotEmpty) {
      query = query.where('categoryId', whereIn: categories);
    }

    return query.orderBy('createdAt', descending: true).snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Listing.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
