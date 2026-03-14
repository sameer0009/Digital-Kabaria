import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_record.freezed.dart';
part 'transaction_record.g.dart';

enum PaymentStatus { pending, partiallyPaid, paid, failed, refunded }

@freezed
abstract class TransactionRecord with _$TransactionRecord {
  const factory TransactionRecord({
    required String id,
    required String pickupId,
    required double amount,
    required String paymentMethod,
    @Default(PaymentStatus.pending) PaymentStatus paymentStatus,
    String? notes,
    DateTime? createdAt,
  }) = _TransactionRecord;

  factory TransactionRecord.fromJson(Map<String, dynamic> json) => _$TransactionRecordFromJson(json);
}
