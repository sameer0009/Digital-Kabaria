import 'package:freezed_annotation/freezed_annotation.dart';

part 'pickup_order.freezed.dart';
part 'pickup_order.g.dart';

enum PickupStatus { awaitingSchedule, scheduled, enRoute, arrived, pickedUp, completed, cancelled, disputed, paymentFailed }

@freezed
abstract class PickupOrder with _$PickupOrder {
  const factory PickupOrder({
    required String id,
    required String listingId,
    required String quoteId,
    required String sellerId,
    required String dealerId,
    @Default(PickupStatus.awaitingSchedule) PickupStatus status,
    String? scheduledTime,
    double? actualWeight,
    double? finalAmount,
    String? otpCode,
    String? ratingId,
    DateTime? createdAt,
  }) = _PickupOrder;

  factory PickupOrder.fromJson(Map<String, dynamic> json) => _$PickupOrderFromJson(json);
}
