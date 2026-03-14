import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pickupRepositoryProvider = Provider<PickupRepository>((ref) {
  return PickupRepository(FirebaseFirestore.instance);
});

class PickupRepository {
  final FirebaseFirestore _firestore;

  PickupRepository(this._firestore);

  CollectionReference get _pickups => _firestore.collection('pickup_orders');

  Future<void> createPickup(PickupOrder order) async {
    await _pickups.doc(order.id).set(order.toJson());
  }

  Stream<List<PickupOrder>> watchDealerPickups(String dealerId) {
    return _pickups
        .where('dealerId', isEqualTo: dealerId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PickupOrder.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }

  Stream<PickupOrder?> watchListingPickup(String listingId) {
    return _pickups
        .where('listingId', isEqualTo: listingId)
        .limit(1)
        .snapshots()
        .map((snapshot) => snapshot.docs.isNotEmpty 
            ? PickupOrder.fromJson(snapshot.docs.first.data() as Map<String, dynamic>) 
            : null);
  }
}
