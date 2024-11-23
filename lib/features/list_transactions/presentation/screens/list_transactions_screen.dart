import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/features/add_transaction/add_transaction.dart';
import 'package:budget_tracker/features/transaction/transaction.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Транзакции'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transactionItem = transactions[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  _formatDate(transactionItem.date),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              ...transactionItem.items.map((transaction) {
                return TransactionTile(transaction: transaction);
              }),
            ],
          );
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

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getCategoryColor(transaction.category),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.category, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.category.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.type == TransactionType.expense
                        ? 'Расход'
                        : 'Доход',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '${transaction.type == TransactionType.expense ? '-' : '+'}${transaction.amount.toStringAsFixed(2)} ₽',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: transaction.type == TransactionType.expense
                  ? Colors.red
                  : Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.food:
        return Colors.green;
      case TransactionCategory.entertainment:
        return Colors.orange;
      case TransactionCategory.transportation:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

class TransactionItem {
  final DateTime date;
  final List<Transaction> items;

  TransactionItem({required this.date, required this.items});
}

final List<TransactionItem> transactions = [
  TransactionItem(
    date: DateTime.now().subtract(const Duration(days: 1)),
    items: [
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
    ],
  ),
  TransactionItem(
    date: DateTime.now().subtract(const Duration(days: 2)),
    items: [
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
    ],
  ),
];
