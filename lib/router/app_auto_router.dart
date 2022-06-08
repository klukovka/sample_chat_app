import 'package:auto_route/auto_route.dart';
import 'package:sample_chat_app/pages/main_page/tabs/calls_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/chats_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/person_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/settings_tab.dart';

import '../pages/main_page/main_page.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Tab,Route',
  routes: [
    CustomRoute(
      page: MainPage,
      path: '/main/',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
      children: [
        AutoRoute(
          page: ChatsTab,
          path: 'chats',
          initial: true,
        ),
        AutoRoute(
          page: CallsTab,
          path: 'calls',
        ),
        AutoRoute(
          page: PersonTab,
          path: 'person',
        ),
        AutoRoute(
          page: SettingsTab,
          path: 'settings',
        ),
      ],
    ),
  ],
)
class $AppAutoRouter {}
