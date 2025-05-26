import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/app/app.dart';
import 'package:budget_tracker/features/auth/auth.dart';
import 'package:budget_tracker/features/start/start.dart';

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
          children: const [],
          guards: [
            FirstLaunchGuard(),
          ],
        ),
        StartRoutes.route,
        ...AuthRoutes.routes,
      ];
}
