import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/features/internet_connection_checker/internet_connection_checker.dart';
import 'package:budget_tracker/utils/app_runner/app_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class MainAppBuilder extends AppBuilder {
  MainAppBuilder(this.appRouter);

  List<SingleChildWidget> get providers => [];

  final RootStackRouter appRouter;

  @override
  Widget buildApp() {
    return Builder(
      builder: (context) => MaterialApp.router(
        onGenerateTitle: (context) => 'Budget Tracker',
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: InternetConnectionCheckerWrapper(child: child!),
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
