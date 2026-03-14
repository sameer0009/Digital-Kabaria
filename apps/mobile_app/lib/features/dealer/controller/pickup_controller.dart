import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';

final pickupControllerProvider = AsyncNotifierProvider<PickupController, void>(PickupController.new);

class PickupController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> completePickup({
    required PickupOrder order,
    required double actualWeight,
    required double finalAmount,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // 1. Update order status
      final updatedOrder = order.copyWith(
        status: PickupStatus.completed,
        actualWeight: actualWeight,
        finalAmount: finalAmount,
      );
      await ref.read(pickupRepositoryProvider).createPickup(updatedOrder);

      // 2. Create transaction record
      final transaction = TransactionRecord(
        id: const Uuid().v4(),
        pickupId: order.id,
        amount: finalAmount,
        paymentMethod: 'Cash', // Default for MVP
        paymentStatus: PaymentStatus.paid,
      );
      await ref.read(transactionRepositoryProvider).logTransaction(transaction);
    });
  }
}
