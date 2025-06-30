import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';

class StartRoutes {
  static final route = AutoRoute(
    path: AppRoutePaths.startScreen,
    page: StartRoute.page,
  );
}
