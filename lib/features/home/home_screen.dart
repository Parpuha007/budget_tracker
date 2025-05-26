import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Реализовать логику выхода
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Добро пожаловать!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
