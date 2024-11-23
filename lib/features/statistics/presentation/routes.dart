import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';

class StatisticsRoutes {
  static final route = AutoRoute(
    path: AppRoutePaths.statisticsScreen,
    page: StatisticsRoute.page,
  );
}
