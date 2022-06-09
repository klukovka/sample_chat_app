// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i11;
import 'package:flutter/material.dart' as _i10;

import '../pages/auth/edit_phone_number_page.dart' as _i2;
import '../pages/auth/hello_page.dart' as _i1;
import '../pages/auth/select_country_page.dart' as _i3;
import '../pages/main_page/main_page.dart' as _i4;
import '../pages/main_page/tabs/calls_tab.dart' as _i6;
import '../pages/main_page/tabs/chats_tab.dart' as _i5;
import '../pages/main_page/tabs/person_tab.dart' as _i7;
import '../pages/main_page/tabs/settings_tab.dart' as _i8;

class AppAutoRouter extends _i9.RootStackRouter {
  AppAutoRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HelloRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.HelloPage(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EditPhoneNumberRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.EditPhoneNumberPage(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    SelectCountryRoute.name: (routeData) {
      final args = routeData.argsAs<SelectCountryRouteArgs>();
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child:
              _i3.SelectCountryPage(key: args.key, onSelected: args.onSelected),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    MainRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.MainPage(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ChatsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ChatsTab());
    },
    CallsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CallsTab());
    },
    PersonRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.PersonTab());
    },
    SettingsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SettingsTab());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig('/#redirect',
            path: '/', redirectTo: '/hello/', fullMatch: true),
        _i9.RouteConfig(HelloRoute.name, path: '/hello/'),
        _i9.RouteConfig(EditPhoneNumberRoute.name, path: '/phoneNumber/'),
        _i9.RouteConfig(SelectCountryRoute.name, path: '/phoneNumber/country'),
        _i9.RouteConfig(MainRoute.name, path: '/main/', children: [
          _i9.RouteConfig('#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'chats',
              fullMatch: true),
          _i9.RouteConfig(ChatsRoute.name,
              path: 'chats', parent: MainRoute.name),
          _i9.RouteConfig(CallsRoute.name,
              path: 'calls', parent: MainRoute.name),
          _i9.RouteConfig(PersonRoute.name,
              path: 'person', parent: MainRoute.name),
          _i9.RouteConfig(SettingsRoute.name,
              path: 'settings', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HelloPage]
class HelloRoute extends _i9.PageRouteInfo<void> {
  const HelloRoute() : super(HelloRoute.name, path: '/hello/');

  static const String name = 'HelloRoute';
}

/// generated route for
/// [_i2.EditPhoneNumberPage]
class EditPhoneNumberRoute extends _i9.PageRouteInfo<void> {
  const EditPhoneNumberRoute()
      : super(EditPhoneNumberRoute.name, path: '/phoneNumber/');

  static const String name = 'EditPhoneNumberRoute';
}

/// generated route for
/// [_i3.SelectCountryPage]
class SelectCountryRoute extends _i9.PageRouteInfo<SelectCountryRouteArgs> {
  SelectCountryRoute(
      {_i11.Key? key, required void Function(Map<String, dynamic>) onSelected})
      : super(SelectCountryRoute.name,
            path: '/phoneNumber/country',
            args: SelectCountryRouteArgs(key: key, onSelected: onSelected));

  static const String name = 'SelectCountryRoute';
}

class SelectCountryRouteArgs {
  const SelectCountryRouteArgs({this.key, required this.onSelected});

  final _i11.Key? key;

  final void Function(Map<String, dynamic>) onSelected;

  @override
  String toString() {
    return 'SelectCountryRouteArgs{key: $key, onSelected: $onSelected}';
  }
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i5.ChatsTab]
class ChatsRoute extends _i9.PageRouteInfo<void> {
  const ChatsRoute() : super(ChatsRoute.name, path: 'chats');

  static const String name = 'ChatsRoute';
}

/// generated route for
/// [_i6.CallsTab]
class CallsRoute extends _i9.PageRouteInfo<void> {
  const CallsRoute() : super(CallsRoute.name, path: 'calls');

  static const String name = 'CallsRoute';
}

/// generated route for
/// [_i7.PersonTab]
class PersonRoute extends _i9.PageRouteInfo<void> {
  const PersonRoute() : super(PersonRoute.name, path: 'person');

  static const String name = 'PersonRoute';
}

/// generated route for
/// [_i8.SettingsTab]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}
