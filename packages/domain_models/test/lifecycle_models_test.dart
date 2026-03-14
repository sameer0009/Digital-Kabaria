import 'package:domain_models/domain_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PickupOrder Model', () {
    test('should serialize and deserialize correctly', () {
      final order = PickupOrder(
        id: 'p_1',
        listingId: 'l_1',
        quoteId: 'q_1',
        sellerId: 's_1',
        dealerId: 'd_1',
        status: PickupStatus.scheduled,
        scheduledTime: '2026-03-20 10:00',
      );

      final json = order.toJson();
      expect(json['status'], 'scheduled');

      final deserialized = PickupOrder.fromJson(json);
      expect(deserialized.scheduledTime, '2026-03-20 10:00');
    });
  });

  group('TransactionRecord Model', () {
    test('should serialize and deserialize correctly', () {
      final record = TransactionRecord(
        id: 't_1',
        pickupId: 'p_1',
        amount: 500.0,
        paymentMethod: 'Cash',
        paymentStatus: PaymentStatus.paid,
        createdAt: DateTime.now(),
      );

      final json = record.toJson();
      expect(json['paymentStatus'], 'paid');
      expect(json['amount'], 500.0);

      final deserialized = TransactionRecord.fromJson(json);
      expect(deserialized.paymentStatus, PaymentStatus.paid);
    });
  });
}
