import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/di/di.dart';
import 'package:budget_tracker/features/add_transaction/add_transaction.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
import 'package:budget_tracker/features/statistics/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  final _listTransactionsCubit = getIt<ListTransactionsCubit>();
  @override
  void initState() {
    _loadTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Транзакции'),
        actions: [
          IconButton(
            onPressed: () {
              _listTransactionsCubit.deleteTransactions();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadTransactions,
        child: BlocConsumer(
          listener: (context, state) {
            if (state is ListTransactionsSuccess ||
                state is ListTransactionsEmpty) {
              getIt<StatisticsCubit>().loadStatistics();
            }
          },
          bloc: _listTransactionsCubit,
          builder: (context, state) {
            if (state is ListTransactionsSuccess) {
              final transactionsList = state.groupedTransactionsList;
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                itemCount: transactionsList.length,
                itemBuilder: (context, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          _formatDate(transactionsList[i].date),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ...transactionsList[i].items.map((transaction) {
                        return Dismissible(
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            _listTransactionsCubit
                                .deleteTransaction(transaction.id);
                          },
                          direction: DismissDirection.endToStart,
                          key: ValueKey(transaction.id),
                          child: TransactionTile(transaction: transaction),
                        );
                      }),
                    ],
                  );
                },
              );
            }
            if (state is ListTransactionsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ListTransactionsEmpty) {
              return const Center(
                child: Text('Вы пока не добавили транзакции'),
              );
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTransactionScreen(),
            ),
          );
          _loadTransactions();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _loadTransactions() async {
    _listTransactionsCubit.loadTransactions();
  }

  String _formatDate(DateTime date) {
    return '${date.day} ${_monthToString(date.month)}';
  }

  String _monthToString(int month) {
    const months = [
      'января',
      'февраля',
      'марта',
      'апреля',
      'мая',
      'июня',
      'июля',
      'августа',
      'сентября',
      'октября',
      'ноября',
      'декабря',
    ];
    return months[month - 1];
  }
}
