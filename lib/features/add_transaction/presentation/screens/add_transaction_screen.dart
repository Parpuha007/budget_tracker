import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/di/di.dart';
import 'package:budget_tracker/features/add_transaction/add_transaction.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart'
    hide ListTransactionsCubit;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  AddTransactionScreenState createState() => AddTransactionScreenState();
}

class AddTransactionScreenState extends State<AddTransactionScreen> {
  final _addTransactionCubit = getIt<AddTransactionCubit>();
  final TextEditingController amountController = TextEditingController();

  TransactionType transactionType = TransactionType.expense;
  TransactionCategory selectedCategory = TransactionCategory.food;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTransactionCubit, AddTransactionState>(
      bloc: _addTransactionCubit,
      listener: (context, state) {
        if (state is AddTransactionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Транзакция успешно добавлена')),
          );
          setState(() {
            amountController.clear();
            transactionType = TransactionType.expense;
            selectedCategory = TransactionCategory.food;
            selectedDate = DateTime.now();
          });
        }
      },
      builder: (context, state) {
        if (state is AddTransactionLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Transaction'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: Text(TransactionType.income.title),
                      selected: transactionType == TransactionType.income,
                      onSelected: (_) {
                        setState(() {
                          transactionType = TransactionType.income;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: Text(TransactionType.expense.title),
                      selected: transactionType == TransactionType.expense,
                      onSelected: (_) {
                        setState(() {
                          transactionType = TransactionType.expense;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Сумма',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<TransactionCategory>(
                  value: selectedCategory,
                  items: TransactionCategory.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.title),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Категория',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Выбор даты
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Дата: ${DateFormat('dd/MM/yyyy').format(selectedDate)}'),
                    TextButton(
                      onPressed: _selectDate,
                      child: const Text('Выбрать дату'),
                    ),
                  ],
                ),
                const Spacer(),

                // Кнопка добавления транзакции
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _addTransaction,
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _addTransaction() {
    final double? amount = double.tryParse(amountController.text);
    if (amount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите валидную сумму')),
      );
      return;
    }
    final newTransaction = Transaction(
      type: transactionType,
      amount: amount,
      category: selectedCategory,
      date: selectedDate,
      id: selectedDate.millisecondsSinceEpoch,
    );
    _addTransactionCubit.addTransaction(newTransaction);
  }
}
