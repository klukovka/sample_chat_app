// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/main_page/main_page.dart' as _i1;
import '../pages/main_page/tabs/calls_tab.dart' as _i3;
import '../pages/main_page/tabs/chats_tab.dart' as _i2;
import '../pages/main_page/tabs/person_tab.dart' as _i4;
import '../pages/main_page/tabs/settings_tab.dart' as _i5;

class AppAutoRouter extends _i6.RootStackRouter {
  AppAutoRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.MainPage(),
          transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ChatsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ChatsTab());
    },
    CallsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.CallsTab());
    },
    PersonRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PersonTab());
    },
    SettingsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingsTab());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main/', fullMatch: true),
        _i6.RouteConfig(MainRoute.name, path: '/main/', children: [
          _i6.RouteConfig('#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'chats',
              fullMatch: true),
          _i6.RouteConfig(ChatsRoute.name,
              path: 'chats', parent: MainRoute.name),
          _i6.RouteConfig(CallsRoute.name,
              path: 'calls', parent: MainRoute.name),
          _i6.RouteConfig(PersonRoute.name,
              path: 'person', parent: MainRoute.name),
          _i6.RouteConfig(SettingsRoute.name,
              path: 'settings', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.ChatsTab]
class ChatsRoute extends _i6.PageRouteInfo<void> {
  const ChatsRoute() : super(ChatsRoute.name, path: 'chats');

  static const String name = 'ChatsRoute';
}

/// generated route for
/// [_i3.CallsTab]
class CallsRoute extends _i6.PageRouteInfo<void> {
  const CallsRoute() : super(CallsRoute.name, path: 'calls');

  static const String name = 'CallsRoute';
}

/// generated route for
/// [_i4.PersonTab]
class PersonRoute extends _i6.PageRouteInfo<void> {
  const PersonRoute() : super(PersonRoute.name, path: 'person');

  static const String name = 'PersonRoute';
}

/// generated route for
/// [_i5.SettingsTab]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}
