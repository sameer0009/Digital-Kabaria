// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quote _$QuoteFromJson(Map<String, dynamic> json) => _Quote(
  id: json['id'] as String,
  listingId: json['listingId'] as String,
  dealerId: json['dealerId'] as String,
  amount: (json['amount'] as num).toDouble(),
  message: json['message'] as String?,
  expectedPickupTiming: json['expectedPickupTiming'] as String?,
  status:
      $enumDecodeNullable(_$QuoteStatusEnumMap, json['status']) ??
      QuoteStatus.sent,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$QuoteToJson(_Quote instance) => <String, dynamic>{
  'id': instance.id,
  'listingId': instance.listingId,
  'dealerId': instance.dealerId,
  'amount': instance.amount,
  'message': instance.message,
  'expectedPickupTiming': instance.expectedPickupTiming,
  'status': _$QuoteStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$QuoteStatusEnumMap = {
  QuoteStatus.sent: 'sent',
  QuoteStatus.viewed: 'viewed',
  QuoteStatus.accepted: 'accepted',
  QuoteStatus.rejected: 'rejected',
  QuoteStatus.expired: 'expired',
  QuoteStatus.withdrawn: 'withdrawn',
};
