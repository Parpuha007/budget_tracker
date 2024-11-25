import 'package:budget_tracker/features/list_transactions/list_transactions.dart';

class StatisticsData {
  StatisticsData({
    required this.income,
    required this.expense,
  });
  final Map<TransactionCategory, double> income;
  final Map<TransactionCategory, double> expense;
  double? get incomeTotalAmount {
    return expense.entries.fold<double>(
        0, (previousValue, element) => previousValue + element.value);
  }

  double? get expenseTotalAmount {
    return income.entries.fold<double>(
        0, (previousValue, element) => previousValue + element.value);
  }
}
