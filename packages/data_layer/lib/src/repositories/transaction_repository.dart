import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(FirebaseFirestore.instance);
});

class TransactionRepository {
  final FirebaseFirestore _firestore;

  TransactionRepository(this._firestore);

  CollectionReference get _transactions => _firestore.collection('transactions');

  Future<void> logTransaction(TransactionRecord tx) async {
    await _transactions.doc(tx.id).set(tx.toJson());
  }

  Stream<List<TransactionRecord>> watchTransactions(String pickupId) {
    return _transactions
        .where('pickupId', isEqualTo: pickupId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => TransactionRecord.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }
}
