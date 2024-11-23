import 'dart:async';

import 'package:budget_tracker/router/router.dart';
import 'package:flutter/material.dart';

class InternetConnectionCheckerWrapper extends StatefulWidget {
  const InternetConnectionCheckerWrapper({super.key, required this.child});
  final Widget child;

  @override
  InternetConnectionCheckerWrapperState createState() =>
      InternetConnectionCheckerWrapperState();
}

class InternetConnectionCheckerWrapperState
    extends State<InternetConnectionCheckerWrapper> {
  StreamSubscription<bool>? _connectivitySub;

  /// Флушбар пришлось сделать глобальным в силу того, что во флушбар передается
  /// глобальный контекст, при переходе на следующий экран, где этого контекста нет
  /// невозможно управлять ни флушбаром, ни его ключом
  // final internetErrorFlushBar =
  //     getIt<InternetCheckerStore>().state.globalFlushBar;

  @override
  void initState() {
    super.initState();
    // _connectivitySub = getIt<ConnectivityService>()
    //     .connectChanged
    //     .listen(_onConnectivityCahnged);
  }

  @override
  void dispose() {
    _connectivitySub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _onConnectivityCahnged(bool connected) {
    if (!connected) {
      final routerContext = appRouter.navigatorKey.currentContext;

      // if (internetErrorFlushBar != null) {
      //   internetErrorFlushBar!.show(routerContext);
      // }
    } else {
      // final canDismiss = internetErrorFlushBar?.isDismissible ?? false;
      // if (canDismiss) {
      //   internetErrorFlushBar?.dismiss();
      // }
    }
  }
}
