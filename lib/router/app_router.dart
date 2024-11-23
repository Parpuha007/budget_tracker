import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/app/app.dart';
import 'package:budget_tracker/features/add_transaction/add_transaction.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
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
// AddTransactionRoutes.route,
          ],
          guards: const [],
        ),
      ];

  // TabsRouter get tabRouter => childControllers.whereType<TabsRouter>().first;

  // bool isFirstPage() {
  //   return !childControllers.whereType<TabsRouter>().first.canPop();
  // }

  // Future launchUrl(
  //   String link, {
  //   required LaunchMode launchMode,
  //   bool includeLocale = false,
  // }) async {
  //   final url = Uri.tryParse(link);
  //   if (url == null) {
  //     throw ErrorModel(
  //       message: '${trStr(LocaleKeys.urlLaunchNotOpenError)} $link',
  //     );
  //   }
  //   if (await url_launcher.canLaunchUrl(url)) {
  //     return url_launcher
  //         .launchUrl(
  //       url,
  //       mode: launchMode,
  //     )
  //         .catchError(
  //       (_) {
  //         throw ErrorModel(
  //           message: '${trStr(LocaleKeys.urlLaunchNotOpenError)} $link',
  //         );
  //       },
  //     );
  //   }
  //   throw ErrorModel(
  //     message: '${trStr(LocaleKeys.urlLaunchNotOpenError)} $link',
  //   );
  // }
}
