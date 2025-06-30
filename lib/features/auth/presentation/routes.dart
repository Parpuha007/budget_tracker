import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';

class AuthRoutes {
  static List<AutoRoute> routes = [
    AutoRoute(
      path: '/sign-in',
      page: SignInRoute.page,
    ),
    AutoRoute(
      path: '/sign-up',
      page: SignUpRoute.page,
    ),
  ];
}
