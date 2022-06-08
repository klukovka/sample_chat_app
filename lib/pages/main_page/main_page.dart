import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'main_page_item_type.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: MainMenuItemType.values.map((item) => item.getRoute()).toList(),
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: MainMenuItemType.values.map(
              (item) {
                return item.getBottomNavigationBarItem(context);
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
