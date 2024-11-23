import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';

class ListTransactionsRoutes {
  static final route = AutoRoute(
    path: AppRoutePaths.listTransactionsScreen,
    page: TransactionListRoute.page,
  );
}
