import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
@HiveType(typeId: 0) // Указываем уникальный typeId для этой модели
class Transaction with _$Transaction {
  const factory Transaction({
    @HiveField(0) required int id,
    @HiveField(1) required TransactionType type,
    @HiveField(2) required double amount,
    @HiveField(3) required TransactionCategory category,
    @HiveField(4) required DateTime date,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@HiveType(typeId: 1)
enum TransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense;

  String get title {
    switch (this) {
      case income:
        return 'Доход';
      case expense:
        return 'Расход';
    }
  }

  String get sign {
    switch (this) {
      case income:
        return '+';
      case expense:
        return '-';
    }
  }
}

@HiveType(typeId: 2)
enum TransactionCategory {
  @HiveField(0)
  food,
  @HiveField(1)
  entertainment,
  @HiveField(2)
  transportation,
  @HiveField(3)
  other;

  String get title {
    switch (this) {
      case food:
        return 'Еда';
      case entertainment:
        return 'Развлечения';
      case transportation:
        return 'Транспорт';
      case other:
        return 'Другое';
    }
  }

  IconData get icon {
    switch (this) {
      case food:
        return Icons.restaurant;
      case entertainment:
        return Icons.sports_esports;
      case transportation:
        return Icons.directions_car;
      case other:
        return Icons.category;
    }
  }

  Color get color {
    switch (this) {
      case food:
        return Colors.green;
      case entertainment:
        return Colors.orange;
      case transportation:
        return Colors.blue;
      case other:
        return Colors.grey;
    }
  }
}
