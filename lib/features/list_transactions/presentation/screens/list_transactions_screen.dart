import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/di/di.dart';
import 'package:budget_tracker/features/add_transaction/add_transaction.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
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
    _listTransactionsCubit.loadTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Транзакции'),
      ),
      body: BlocBuilder(
        bloc: _listTransactionsCubit,
        builder: (context, state) {
          if (state is Loaded) {
            final transactionsList = state.groupedTransactionsList;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
                      return TransactionTile(transaction: transaction);
                    }),
                  ],
                );
              },
            );
          }
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTransactionScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
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
