import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:budget_tracker/uikit/uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AutoTabsScaffold(
          routes: const [
            TransactionListRoute(),
            StatisticsRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            const activeColor = AppColors.tiffany;
            return CupertinoTabBar(
              activeColor: activeColor,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                // if (index == tabsRouter.activeIndex) {
                //   if (appRouter.tabRouter.canPop()) {
                //     appRouter.tabRouter.maybePopTop();
                //   } else {
                //     for (final item in tabRootScreens) {
                //       if (item.tab.index == index) {
                //         item.onTabTappedInRoot();
                //       }
                //     }
                //   }
                // }
                tabsRouter.setActiveIndex(index);
              },
              height: 63,
              items: [
                _customBottomNavigationBarItem(
                  activeIcon: const Icon(Icons.abc_outlined),
                  icon: const Icon(Icons.abc),
                  label: 'Главная',
                ),
                _customBottomNavigationBarItem(
                  activeIcon: const Icon(Icons.ac_unit),
                  icon: const Icon(Icons.ac_unit_outlined),
                  label: 'Статистика',
                ),
                // _customBottomNavigationBarItem(
                //   activeIcon: Assets.svg.supportTab.svg(),
                //   icon: Assets.svg.supportTabInactive.svg(),
                //   label: trStr(LocaleKeys.supportTab),
                // ),
                // _customBottomNavigationBarItem(
                //   activeIcon: Assets.svg.profileTab.svg(),
                //   icon: Assets.svg.profileTabInactive.svg(),
                //   label: trStr(LocaleKeys.profile),
                // ),
                // _customBottomNavigationBarItem(
                //   activeIcon: Assets.svg.additionalTab.svg(),
                //   icon: Assets.svg.additionalTabInactive.svg(),
                //   label: trStr(LocaleKeys.moreTab),
                // ),
              ],
            );
          },
        ),
      ],
    );
  }

  //TODO: выпилить build-методы
  BottomNavigationBarItem _customBottomNavigationBarItem({
    required Widget? activeIcon,
    required Widget icon,
    required String? label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: _padding(
        child: activeIcon,
      ),
      icon: _padding(
        child: icon,
      ),
      label: label,
    );
  }

  Widget _padding({
    required Widget? child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: child,
    );
  }
}

// final tabRootScreens = <RootTabScreenMixin>[];
// mixin RootTabScreenMixin<T extends StatefulWidget> on State<T> {
//   RouterTab get tab;

//   void onTabTappedInRoot();

//   @override
//   void initState() {
//     super.initState();
//     register();
//   }

//   @override
//   void dispose() {
//     tabRootScreens.remove(this);
//     super.dispose();
//   }

//   void register() {
//     tabRootScreens.add(this);
//   }
// }
