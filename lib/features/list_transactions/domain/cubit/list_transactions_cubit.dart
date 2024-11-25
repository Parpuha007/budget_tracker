import 'package:budget_tracker/di/di.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
import 'package:budget_tracker/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'list_transactions_cubit.freezed.dart';
part 'list_transactions_state.dart';

@Singleton()
class ListTransactionsCubit extends Cubit<ListTransactionsState> {
  ListTransactionsCubit() : super(const _Initial());

  final _localStorage = getIt<LocalStorage>();

  Future<void> loadTransactions() async {
    emit(const ListTransactionsLoading());
    final transactions = await _localStorage.loadTransactions();
    if (transactions.isEmpty) {
      emit(const ListTransactionsEmpty());
      return;
    }
    emit(ListTransactionsSuccess(_groupTransactionsByDate(transactions)));
  }

  Future<void> deleteTransaction(int id) async {
    emit(const ListTransactionsLoading());
    await _localStorage.deleteTransaction(id);
    loadTransactions();
  }

  Future<void> deleteTransactions() async {
    emit(const ListTransactionsLoading());
    await _localStorage.clearTransactions();
    loadTransactions();
  }

  List<TransactionsGroupByDate> _groupTransactionsByDate(
      List<Transaction> transactions) {
    // Группируем транзакции по датам
    final Map<DateTime, List<Transaction>> groupedMap = {};

    for (var transaction in transactions) {
      // Получаем только дату без времени
      final dateOnly = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );

      // Добавляем транзакцию в соответствующую группу
      if (groupedMap.containsKey(dateOnly)) {
        groupedMap[dateOnly]?.add(transaction);
      } else {
        groupedMap[dateOnly] = [transaction];
      }
    }

    return groupedMap.entries
        .map((entry) =>
            TransactionsGroupByDate(date: entry.key, items: entry.value))
        .toList();
  }
}
