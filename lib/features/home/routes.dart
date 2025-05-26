import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';

class HomeRoutes {
  static final route = AutoRoute(
    path: AppRoutePaths.homeScreen,
    page: HomeRoute.page,
  );
}
