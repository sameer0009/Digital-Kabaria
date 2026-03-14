// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Listing _$ListingFromJson(Map<String, dynamic> json) => _Listing(
  id: json['id'] as String,
  sellerId: json['sellerId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  categoryId: json['categoryId'] as String,
  quantityEstimate: (json['quantityEstimate'] as num).toDouble(),
  unit: json['unit'] as String,
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  status:
      $enumDecodeNullable(_$ListingStatusEnumMap, json['status']) ??
      ListingStatus.submitted,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ListingToJson(_Listing instance) => <String, dynamic>{
  'id': instance.id,
  'sellerId': instance.sellerId,
  'title': instance.title,
  'description': instance.description,
  'categoryId': instance.categoryId,
  'quantityEstimate': instance.quantityEstimate,
  'unit': instance.unit,
  'images': instance.images,
  'status': _$ListingStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$ListingStatusEnumMap = {
  ListingStatus.draft: 'draft',
  ListingStatus.submitted: 'submitted',
  ListingStatus.visibleToDealers: 'visibleToDealers',
  ListingStatus.quoted: 'quoted',
  ListingStatus.pickedUp: 'pickedUp',
  ListingStatus.completed: 'completed',
};
