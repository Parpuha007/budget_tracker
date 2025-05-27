import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirstLaunchGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Пользователь авторизован — пропускаем
      resolver.next();
    } else {
      // Пользователь не авторизован — перенаправляем на старт
      router.replaceAll([const StartRoute()]);
    }
  }
}
