import 'package:freezed_annotation/freezed_annotation.dart';

part 'scrap_category.freezed.dart';
part 'scrap_category.g.dart';

@freezed
abstract class ScrapCategory with _$ScrapCategory {
  const factory ScrapCategory({
    required String id,
    required String name,
    String? description,
    required String unit, // kg, ton, piece, lot
    @Default(0) int sortOrder,
    @Default(true) bool active,
    String? iconUrl,
  }) = _ScrapCategory;

  factory ScrapCategory.fromJson(Map<String, dynamic> json) => _$ScrapCategoryFromJson(json);
}

@freezed
abstract class ScrapSubcategory with _$ScrapSubcategory {
  const factory ScrapSubcategory({
    required String id,
    required String parentId,
    required String name,
    required String unit,
    @Default(true) bool active,
  }) = _ScrapSubcategory;

  factory ScrapSubcategory.fromJson(Map<String, dynamic> json) => _$ScrapSubcategoryFromJson(json);
}
