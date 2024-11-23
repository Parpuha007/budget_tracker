import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';

class AddTransactionRoutes {
  static final route = AutoRoute(
    path: AppRoutePaths.addTransactionScreen,
    page: AddTransactionRoute.page,
  );
}
