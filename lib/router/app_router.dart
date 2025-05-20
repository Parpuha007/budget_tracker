import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/app/app.dart';
import 'package:budget_tracker/features/add_transaction/add_transaction.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
import 'package:budget_tracker/features/start/start.dart';
import 'package:budget_tracker/features/statistics/statistics.dart';

part 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Screen|Modal|View|Wrapper,Route')
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          path: '/',
          children: [
            ListTransactionsRoutes.route,
            StatisticsRoutes.route,
          ],
          guards: [
            FirstLaunchGuard(),
          ],
        ),
        StartRoutes.route,
      ];
}
