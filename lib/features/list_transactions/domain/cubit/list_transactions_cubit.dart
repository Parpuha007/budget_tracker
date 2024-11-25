import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'list_transactions_cubit.freezed.dart';
part 'list_transactions_state.dart';

@Injectable()
class ListTransactionsCubit extends Cubit<ListTransactionsState> {
  ListTransactionsCubit() : super(const _Initial());

  Future<void> loadTransactions() async {
    emit(const Loading());
    await Future.delayed(const Duration(seconds: 3));
    emit(Loaded(_groupTransactionsByDate(transactions)));
  }

  List<TransactionsGroup> _groupTransactionsByDate(
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

    // Преобразуем Map в List<TransactionsGroup>
    return groupedMap.entries
        .map((entry) => TransactionsGroup(date: entry.key, items: entry.value))
        .toList();
  }
}

final List<Transaction> transactions = [
  Transaction(
    id: 1,
    type: TransactionType.expense,
    amount: 349.0,
    category: TransactionCategory.entertainment,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 2,
    type: TransactionType.expense,
    amount: 349.0,
    category: TransactionCategory.entertainment,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 3,
    type: TransactionType.expense,
    amount: 150.0,
    category: TransactionCategory.transportation,
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Transaction(
    id: 4,
    type: TransactionType.income,
    amount: 150.0,
    category: TransactionCategory.food,
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
];
