import 'package:auto_route/auto_route.dart';
import 'package:sample_chat_app/pages/auth/edit_phone_number_page.dart';
import 'package:sample_chat_app/pages/auth/hello_page.dart';
import 'package:sample_chat_app/pages/main_page/tabs/calls_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/chats_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/person_tab.dart';
import 'package:sample_chat_app/pages/main_page/tabs/settings_tab.dart';

import '../pages/auth/select_country_page.dart';
import '../pages/main_page/main_page.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Tab,Route',
  routes: [
    CustomRoute(
      page: HelloPage,
      path: '/hello/',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: EditPhoneNumberPage,
      path: '/phoneNumber/',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: SelectCountryPage,
      path: '/phoneNumber/country',
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
