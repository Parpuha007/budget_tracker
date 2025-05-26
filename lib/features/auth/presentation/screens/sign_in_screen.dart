import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/app_router.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInWrapper extends StatefulWidget {
  const SignInWrapper({super.key});

  @override
  State<SignInWrapper> createState() => _SignInWrapperState();
}

class _SignInWrapperState extends State<SignInWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: SignInScreen(
        // Указываем, что мы хотим использовать только Email/Password провайдер
        providers: [
          EmailAuthProvider(),
        ],
        // При успешном входе или регистрации
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            // Тут вы можете перенаправить пользователя на главный экран после входа
            context.router.push(const HomeRoute());
          }),
        ],
        // Опционально: настройка внешнего вида
        // headerBuilder: (context, constraints, shrinkOffset) { ... },
        // subtitleBuilder: (context, action) { ... },
        // footerBuilder: (context, action) { ... },
      ),
    );
  }
}
