import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
import 'package:budget_tracker/utils/local_storage/local_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveLocalStorage implements LocalStorage {
  HiveLocalStorage({
    required Box<Transaction> transactionsBox,
  }) : _transactionsBox = transactionsBox;
  static const String _transactionsBoxName = 'transactionsBox';

  final Box<Transaction> _transactionsBox;

  /// Инициализация Hive и открытие бокса
  static Future<HiveLocalStorage> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TransactionAdapter());
    Hive.registerAdapter(TransactionTypeAdapter());
    Hive.registerAdapter(TransactionCategoryAdapter());
    final box = await Hive.openBox<Transaction>(_transactionsBoxName);
    return HiveLocalStorage(transactionsBox: box);
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    await _transactionsBox.add(transaction);
  }

  @override
  Future<List<Transaction>> loadTransactions() async {
    return _transactionsBox.values.toList();
  }

  @override
  Future<void> clearTransactions() async {
    await _transactionsBox.clear();
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final keyToDelete = _transactionsBox.keys.firstWhere(
      (key) => _transactionsBox.get(key)?.id == id,
      orElse: () => null,
    );

    if (keyToDelete != null) {
      await _transactionsBox.delete(keyToDelete);
    }
  }
}
