import 'package:auto_route/auto_route.dart';
import 'package:sample_chat_app/pages/auth/login_page.dart';
import 'package:sample_chat_app/pages/main_page/tabs/calls_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/chats_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/people_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/settings_tab.dart';

import '../pages/main_page/main_page.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Tab,Route',
  routes: [
    CustomRoute(
      page: LoginPage,
      path: '/auth/login',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: MainPage,
      path: '/main/',
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
          page: PeopleTab,
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
