import 'package:budget_tracker/features/list_transactions/list_transactions.dart';

abstract class LocalStorage {
  Future<void> addTransaction(Transaction transaction);
  Future<List<Transaction>> loadTransactions();
  Future<void> clearTransactions();
  Future<void> deleteTransaction(int id);
}
