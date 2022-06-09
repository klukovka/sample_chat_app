// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../pages/auth/login_page.dart' as _i1;
import '../pages/main_page/main_page.dart' as _i2;
import '../pages/main_page/tabs/calls_tab.dart' as _i4;
import '../pages/main_page/tabs/chats_tab.dart' as _i3;
import '../pages/main_page/tabs/person_tab.dart' as _i5;
import '../pages/main_page/tabs/settings_tab.dart' as _i6;

class AppAutoRouter extends _i7.RootStackRouter {
  AppAutoRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.LoginPage(),
          transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    MainRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.MainPage(),
          transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ChatsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ChatsTab());
    },
    CallsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CallsTab());
    },
    PersonRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.PersonTab());
    },
    SettingsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SettingsTab());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig('/#redirect',
            path: '/', redirectTo: '/auth/login', fullMatch: true),
        _i7.RouteConfig(LoginRoute.name, path: '/auth/login'),
        _i7.RouteConfig(MainRoute.name, path: '/main/', children: [
          _i7.RouteConfig('#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'chats',
              fullMatch: true),
          _i7.RouteConfig(ChatsRoute.name,
              path: 'chats', parent: MainRoute.name),
          _i7.RouteConfig(CallsRoute.name,
              path: 'calls', parent: MainRoute.name),
          _i7.RouteConfig(PersonRoute.name,
              path: 'person', parent: MainRoute.name),
          _i7.RouteConfig(SettingsRoute.name,
              path: 'settings', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/auth/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.ChatsTab]
class ChatsRoute extends _i7.PageRouteInfo<void> {
  const ChatsRoute() : super(ChatsRoute.name, path: 'chats');

  static const String name = 'ChatsRoute';
}

/// generated route for
/// [_i4.CallsTab]
class CallsRoute extends _i7.PageRouteInfo<void> {
  const CallsRoute() : super(CallsRoute.name, path: 'calls');

  static const String name = 'CallsRoute';
}

/// generated route for
/// [_i5.PersonTab]
class PersonRoute extends _i7.PageRouteInfo<void> {
  const PersonRoute() : super(PersonRoute.name, path: 'person');

  static const String name = 'PersonRoute';
}

/// generated route for
/// [_i6.SettingsTab]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}
