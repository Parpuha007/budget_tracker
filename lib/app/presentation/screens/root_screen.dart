import 'package:auto_route/auto_route.dart';
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
          routes: const [],
          bottomNavigationBuilder: (_, tabsRouter) {
            const activeColor = AppColors.tiffany;
            return CupertinoTabBar(
              activeColor: activeColor,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              height: 63,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Главная',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.equalizer),
                  label: 'Статистика',
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
