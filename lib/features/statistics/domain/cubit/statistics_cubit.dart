import 'package:budget_tracker/di/di.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
import 'package:budget_tracker/features/statistics/statistics.dart';
import 'package:budget_tracker/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'statistics_cubit.freezed.dart';
part 'statistics_state.dart';

@Singleton()
class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(const StatisticsState.initial());
  final _localStorage = getIt<LocalStorage>();
  Future<void> loadStatistics() async {
    emit(const StatisticsLoading());
    final transactions = await _localStorage.loadTransactions();
    if (transactions.isEmpty) {
      emit(const StatisticsEmpty());
      return;
    }
    emit(StatisticsLoaded(_groupTransactionsByType(transactions)));
  }

  StatisticsData _groupTransactionsByType(List<Transaction> transactions) {
    final result = StatisticsData(expense: {}, income: {});
    final expense = result.expense;
    final income = result.income;
    for (var transaction in transactions) {
      if (transaction.type == TransactionType.expense) {
        if (expense.containsKey(transaction.category)) {
          expense[transaction.category] =
              expense[transaction.category]! + transaction.amount;
        } else {
          expense[transaction.category] = transaction.amount;
        }
      } else if (transaction.type == TransactionType.income) {
        if (income.containsKey(transaction.category)) {
          income[transaction.category] =
              income[transaction.category]! + transaction.amount;
        } else {
          income[transaction.category] = transaction.amount;
        }
      }
    }

    return result;
  }
}
