import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';

final pickupControllerProvider = AsyncNotifierProvider<PickupController, void>(PickupController.new);

class PickupController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> verifyPickupOTP({
    required PickupOrder order,
    required String enteredOtp,
  }) async {
    if (order.otpCode == enteredOtp) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        final updatedOrder = order.copyWith(status: PickupStatus.arrived);
        await ref.read(pickupRepositoryProvider).createPickup(updatedOrder);
      });
      return true;
    }
    return false;
  }

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

  Future<void> reportDispute({
    required PickupOrder order,
    required String reason,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final updatedOrder = order.copyWith(
        status: PickupStatus.disputed,
      );
      await ref.read(pickupRepositoryProvider).createPickup(updatedOrder);
      
      // TODO: Log dispute in a dedicated repository for Admin review
      debugPrint('Dispute reported for order ${order.id}: $reason');
    });
  }

  Future<void> cancelPickup({
    required PickupOrder order,
    required String reason,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final updatedOrder = order.copyWith(
        status: PickupStatus.cancelled,
      );
      await ref.read(pickupRepositoryProvider).createPickup(updatedOrder);
      debugPrint('Pickup cancelled for order ${order.id}: $reason');
    });
  }

  Future<void> submitRating({
    required String pickupOrderId,
    required String fromUserId,
    required String toUserId,
    required double score,
    String? review,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final rating = Rating(
        id: const Uuid().v4(),
        pickupOrderId: pickupOrderId,
        fromUserId: fromUserId,
        toUserId: toUserId,
        score: score,
        review: review,
        createdAt: DateTime.now(),
      );
      await ref.read(ratingRepositoryProvider).submitRating(rating);
    });
  }
}
