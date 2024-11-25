import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    int? id,
    required TransactionType type,
    required double amount,
    required TransactionCategory category,
    required DateTime date,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

enum TransactionType {
  income,
  expense;
}

enum TransactionCategory {
  food,
  entertainment,
  transportation;
}
