import 'package:budget_tracker/app/presentation/app_builder.dart';
import 'package:budget_tracker/firebase_options.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final builder = MainAppBuilder(appRouter);

  runApp(builder.buildApp());
}
