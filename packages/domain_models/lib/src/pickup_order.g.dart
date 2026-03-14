// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PickupOrder _$PickupOrderFromJson(Map<String, dynamic> json) => _PickupOrder(
  id: json['id'] as String,
  listingId: json['listingId'] as String,
  quoteId: json['quoteId'] as String,
  sellerId: json['sellerId'] as String,
  dealerId: json['dealerId'] as String,
  status:
      $enumDecodeNullable(_$PickupStatusEnumMap, json['status']) ??
      PickupStatus.awaitingSchedule,
  scheduledTime: json['scheduledTime'] as String?,
  actualWeight: (json['actualWeight'] as num?)?.toDouble(),
  finalAmount: (json['finalAmount'] as num?)?.toDouble(),
  otpCode: json['otpCode'] as String?,
  ratingId: json['ratingId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$PickupOrderToJson(_PickupOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listingId': instance.listingId,
      'quoteId': instance.quoteId,
      'sellerId': instance.sellerId,
      'dealerId': instance.dealerId,
      'status': _$PickupStatusEnumMap[instance.status]!,
      'scheduledTime': instance.scheduledTime,
      'actualWeight': instance.actualWeight,
      'finalAmount': instance.finalAmount,
      'otpCode': instance.otpCode,
      'ratingId': instance.ratingId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$PickupStatusEnumMap = {
  PickupStatus.awaitingSchedule: 'awaitingSchedule',
  PickupStatus.scheduled: 'scheduled',
  PickupStatus.enRoute: 'enRoute',
  PickupStatus.arrived: 'arrived',
  PickupStatus.pickedUp: 'pickedUp',
  PickupStatus.completed: 'completed',
  PickupStatus.cancelled: 'cancelled',
  PickupStatus.disputed: 'disputed',
  PickupStatus.paymentFailed: 'paymentFailed',
};
