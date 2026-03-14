// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrap_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScrapCategory _$ScrapCategoryFromJson(Map<String, dynamic> json) =>
    _ScrapCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      unit: json['unit'] as String,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      active: json['active'] as bool? ?? true,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$ScrapCategoryToJson(_ScrapCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'unit': instance.unit,
      'sortOrder': instance.sortOrder,
      'active': instance.active,
      'iconUrl': instance.iconUrl,
    };

_ScrapSubcategory _$ScrapSubcategoryFromJson(Map<String, dynamic> json) =>
    _ScrapSubcategory(
      id: json['id'] as String,
      parentId: json['parentId'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$ScrapSubcategoryToJson(_ScrapSubcategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'name': instance.name,
      'unit': instance.unit,
      'active': instance.active,
    };
