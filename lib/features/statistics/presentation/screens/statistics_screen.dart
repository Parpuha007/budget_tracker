import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/features/statistics/statistics.dart';
import 'package:budget_tracker/features/transaction/transaction.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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

@RoutePage()
class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final incomeTotal = transactions
        .where((t) => t.type == TransactionType.income)
        .fold(0.0, (sum, t) => sum + t.amount);

    final expenseTotal = transactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0.0, (sum, t) => sum + t.amount);

    final categoryData = _generateCategoryData(transactions);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Статистика"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatisticsSummaryCard(
                  title: "Доходы",
                  amount: incomeTotal,
                  color: Colors.green,
                ),
                StatisticsSummaryCard(
                  title: "Расходы",
                  amount: expenseTotal,
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: categoryData.map((data) {
                    return PieChartSectionData(
                      value: data.amount,
                      color: data.color,
                      title:
                          "${data.category.name}\n${data.amount.toStringAsFixed(0)}",
                      radius: 60,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList(),
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CategoryData> _generateCategoryData(List<Transaction> transactions) {
    final Map<TransactionCategory, double> categoryTotals = {};

    for (var transaction in transactions) {
      if (transaction.type == TransactionType.expense) {
        categoryTotals.update(
          transaction.category,
          (value) => value + transaction.amount,
          ifAbsent: () => transaction.amount,
        );
      }
    }

    return categoryTotals.entries.map((entry) {
      final color = _getCategoryColor(entry.key);
      return CategoryData(
        category: entry.key,
        amount: entry.value,
        color: color,
      );
    }).toList();
  }

  Color _getCategoryColor(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.food:
        return Colors.blue;
      case TransactionCategory.entertainment:
        return Colors.orange;
      case TransactionCategory.transportation:
        return Colors.purple;
    }
  }
}

class CategoryData {
  final TransactionCategory category;
  final double amount;
  final Color color;

  CategoryData({
    required this.category,
    required this.amount,
    required this.color,
  });
}
