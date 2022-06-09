// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../pages/auth/login_page.dart' as _i1;
import '../pages/chat_page/chat_page.dart' as _i3;
import '../pages/main_page/main_page.dart' as _i2;
import '../pages/main_page/tabs/calls_tab.dart' as _i5;
import '../pages/main_page/tabs/chats_tab.dart' as _i4;
import '../pages/main_page/tabs/people_tab.dart' as _i6;
import '../pages/main_page/tabs/settings_tab.dart' as _i7;

class AppAutoRouter extends _i8.RootStackRouter {
  AppAutoRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.WrappedRoute(child: const _i1.LoginPage()),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    MainRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.MainPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ChatRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChatRouteArgs>(
          orElse: () => ChatRouteArgs(userId: pathParams.getString('userId')));
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.WrappedRoute(
              child: _i3.ChatPage(key: args.key, userId: args.userId)),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ChatsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ChatsTab());
    },
    CallsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CallsTab());
    },
    PeopleRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.WrappedRoute(child: const _i6.PeopleTab()));
    },
    SettingsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SettingsTab());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/auth/login', fullMatch: true),
        _i8.RouteConfig(LoginRoute.name, path: '/auth/login'),
        _i8.RouteConfig(MainRoute.name, path: '/main/', children: [
          _i8.RouteConfig('#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'chats',
              fullMatch: true),
          _i8.RouteConfig(ChatsRoute.name,
              path: 'chats', parent: MainRoute.name),
          _i8.RouteConfig(CallsRoute.name,
              path: 'calls', parent: MainRoute.name),
          _i8.RouteConfig(PeopleRoute.name,
              path: 'person', parent: MainRoute.name),
          _i8.RouteConfig(SettingsRoute.name,
              path: 'settings', parent: MainRoute.name)
        ]),
        _i8.RouteConfig(ChatRoute.name, path: '/main/chats/:userId')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/auth/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.ChatPage]
class ChatRoute extends _i8.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i9.Key? key, required String userId})
      : super(ChatRoute.name,
            path: '/main/chats/:userId',
            args: ChatRouteArgs(key: key, userId: userId),
            rawPathParams: {'userId': userId});

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.userId});

  final _i9.Key? key;

  final String userId;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i4.ChatsTab]
class ChatsRoute extends _i8.PageRouteInfo<void> {
  const ChatsRoute() : super(ChatsRoute.name, path: 'chats');

  static const String name = 'ChatsRoute';
}

/// generated route for
/// [_i5.CallsTab]
class CallsRoute extends _i8.PageRouteInfo<void> {
  const CallsRoute() : super(CallsRoute.name, path: 'calls');

  static const String name = 'CallsRoute';
}

/// generated route for
/// [_i6.PeopleTab]
class PeopleRoute extends _i8.PageRouteInfo<void> {
  const PeopleRoute() : super(PeopleRoute.name, path: 'person');

  static const String name = 'PeopleRoute';
}

/// generated route for
/// [_i7.SettingsTab]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}
