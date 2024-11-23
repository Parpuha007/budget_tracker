import 'package:flutter/widgets.dart';

// Класс который можно расширять через наследование, переопределяя метод buildApp();
abstract class AppBuilder<T> {
  @mustCallSuper
  Widget buildApp();
}
