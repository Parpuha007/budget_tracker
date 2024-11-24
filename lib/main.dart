import 'package:budget_tracker/app/presentation/app_builder.dart';
import 'package:budget_tracker/di/di.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() async {
  final builder = MainAppBuilder(appRouter);
  await configureDependencies(Environment.prod);
  runApp(builder.buildApp());
}
