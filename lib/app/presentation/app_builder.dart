import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/uikit/uikit.dart';
import 'package:budget_tracker/utils/app_runner/app_builder.dart';
import 'package:flutter/material.dart';

class MainAppBuilder extends AppBuilder {
  MainAppBuilder(this.appRouter);

  final RootStackRouter appRouter;

  @override
  Widget buildApp() {
    return Builder(
      builder: (context) => MaterialApp.router(
        theme: appTheme,
        onGenerateTitle: (context) => 'Budget Tracker',
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        ),
        routerDelegate: AutoRouterDelegate(
          appRouter,
          navigatorObservers: () => [
            AutoRouteObserver(),
          ],
        ),
        routeInformationProvider: appRouter.routeInfoProvider(),
        routeInformationParser: appRouter.defaultRouteParser(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
