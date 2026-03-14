import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@freezed
abstract class Rating with _$Rating {
  const factory Rating({
    required String id,
    required String pickupOrderId,
    required String fromUserId,
    required String toUserId,
    required double score,
    String? review,
    required DateTime createdAt,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
