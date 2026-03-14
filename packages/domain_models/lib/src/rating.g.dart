// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Rating _$RatingFromJson(Map<String, dynamic> json) => _Rating(
  id: json['id'] as String,
  pickupOrderId: json['pickupOrderId'] as String,
  fromUserId: json['fromUserId'] as String,
  toUserId: json['toUserId'] as String,
  score: (json['score'] as num).toDouble(),
  review: json['review'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$RatingToJson(_Rating instance) => <String, dynamic>{
  'id': instance.id,
  'pickupOrderId': instance.pickupOrderId,
  'fromUserId': instance.fromUserId,
  'toUserId': instance.toUserId,
  'score': instance.score,
  'review': instance.review,
  'createdAt': instance.createdAt.toIso8601String(),
};
