import 'package:budget_tracker/features/transaction/transaction.dart';

class TransactionsGroup {
  final DateTime date;
  final List<Transaction> items;

  TransactionsGroup({required this.date, required this.items});
}
