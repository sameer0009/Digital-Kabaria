import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

enum QuoteStatus { sent, viewed, accepted, rejected, expired, withdrawn }

@freezed
abstract class Quote with _$Quote {
  const factory Quote({
    required String id,
    required String listingId,
    required String dealerId,
    required double amount,
    String? message,
    String? expectedPickupTiming,
    @Default(QuoteStatus.sent) QuoteStatus status,
    DateTime? createdAt,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
