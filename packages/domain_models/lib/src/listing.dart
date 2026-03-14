import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

enum ListingStatus { draft, submitted, visibleToDealers, quoted, pickedUp, completed }

@freezed
abstract class Listing with _$Listing {
  const factory Listing({
    required String id,
    required String sellerId,
    required String title,
    required String description,
    required String categoryId,
    required double quantityEstimate,
    required String unit,
    @Default([]) List<String> images,
    @Default(ListingStatus.submitted) ListingStatus status,
    DateTime? createdAt,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);
}
