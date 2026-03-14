import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quoteRepositoryProvider = Provider<QuoteRepository>((ref) {
  return QuoteRepository(FirebaseFirestore.instance);
});

class QuoteRepository {
  final FirebaseFirestore _firestore;

  QuoteRepository(this._firestore);

  CollectionReference get _quotes => _firestore.collection('quotes');

  Future<void> submitQuote(Quote quote) async {
    await _quotes.doc(quote.id).set(quote.toJson());
  }

  Stream<List<Quote>> watchListingQuotes(String listingId) {
    return _quotes
        .where('listingId', isEqualTo: listingId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Quote.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }
}
