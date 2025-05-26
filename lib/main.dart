import 'package:budget_tracker/app/presentation/app_builder.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:flutter/material.dart';

void main() async {
  final builder = MainAppBuilder(appRouter);

  runApp(builder.buildApp());
}
