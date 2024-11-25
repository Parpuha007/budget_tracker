import 'package:budget_tracker/features/list_transactions/list_transactions.dart';

class TransactionsGroup {
  final DateTime date;
  final List<Transaction> items;

  TransactionsGroup({required this.date, required this.items});
}
