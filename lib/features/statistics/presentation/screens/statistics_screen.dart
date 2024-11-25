import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/di/di.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
import 'package:budget_tracker/features/statistics/statistics.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({
    super.key,
  });

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final _statisticsCubit = getIt<StatisticsCubit>();
  Map<TransactionCategory, double>? currentData;

  @override
  void initState() {
    _statisticsCubit.loadStatistics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Статистика"),
      ),
      body: BlocConsumer<StatisticsCubit, StatisticsState>(
        bloc: _statisticsCubit,
        listener: (context, state) {
          if (state is StatisticsLoaded) {
            setState(() {
              currentData = state.data.income;
            });
          }
        },
        builder: (context, state) {
          if (state is StatisticsLoaded) {
            final data = state.data;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChoiceChip(
                        label: Text(TransactionType.income.title),
                        selected: currentData == data.income,
                        onSelected: (_) {
                          setState(() {
                            currentData = data.income;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      ChoiceChip(
                        label: Text(TransactionType.expense.title),
                        selected: currentData == data.expense,
                        onSelected: (_) {
                          setState(() {
                            currentData = data.expense;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  currentData?.isNotEmpty ?? false
                      ? Expanded(
                          child: PieChart(
                            PieChartData(
                              sections: currentData?.keys.map(
                                (i) {
                                  return PieChartSectionData(
                                    value: currentData?[i],
                                    color: i.color,
                                    title:
                                        "${i.title}\n${currentData?[i]?.toStringAsFixed(2)}",
                                    radius: 60,
                                    titleStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ).toList(),
                              sectionsSpace: 2,
                              centerSpaceRadius: 40,
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('Нет данных'),
                        ),
                ],
              ),
            );
          }
          if (state is StatisticsEmpty) {
            return const Center(
              child: Text('Нет данных'),
            );
          }
          if (state is StatisticsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
