import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/features/internet_connection_checker/internet_connection_checker.dart';
import 'package:budget_tracker/utils/app_runner/app_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class MainAppBuilder extends AppBuilder {
  MainAppBuilder(this.appRouter);

  List<SingleChildWidget> get providers => [
        // Provider(create: (_) => getIt<AppThemeData>()),
        // BlocProvider.value(
        //   value: getIt<AuthStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<OnBoardingCacheManagerStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<DocumentsLinksStore>()..init(),
        // ),
        // BlocProvider.value(
        //   value: getIt<FirstLaunchStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<UserStore>()..init(),
        // ),
        // BlocProvider.value(
        //   value: getIt<RegistrationOnBoardingStore>()
        //     ..setNavigationState(
        //       OnBoardingInitialScreenState(),
        //     )
        //     ..getCurrentStage(),
        // ),
        // BlocProvider.value(
        //   value: getIt<HomeStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<LocalNotificationsStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<SplashStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<AppUpdateStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<InternetCheckerStore>()..init(),
        // ),
        // BlocProvider.value(
        //   value: getIt<AnalyticsChartPositionStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<FundsWithdrawalStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<CheckAddingAccountPossibilityStore>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<OnboardingTourCubit>(),
        // ),
        // BlocProvider.value(
        //   value: getIt<AppReviewBloc>(),
        // ),
      ];

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
            // TalkerRouteObserver(talker),
          ],
        ),
        // localizationsDelegates: [
        //   ...context.localizationDelegates,
        // ],
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        routeInformationProvider: appRouter.routeInfoProvider(),
        routeInformationParser: appRouter.defaultRouteParser(),
        themeMode: ThemeMode.light,
        // theme: getIt<AppThemeData>().themeData,
      ),
    );
  }
}
