import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';

class FirstLaunchGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (true) {
      // router.push(const StartRoute()).whenComplete(() {
      //   resolver.next();
      // });
      router.replaceAll([const StartRoute()]);
    } else {
      resolver.next();
    }
  }
}
