import 'package:budget_tracker/features/list_transactions/list_transactions.dart';

class TransactionsGroupByDate {
  final DateTime date;
  final List<Transaction> items;

  TransactionsGroupByDate({required this.date, required this.items});
}
