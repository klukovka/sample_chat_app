import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:sample_chat_app/router/app_auto_router.gr.dart';

import 'config/locator.dart';
import 'l10n/sample_chat_localizations.dart';

class SampleChatApp extends StatelessWidget {
  const SampleChatApp({super.key});

  ThemeData get _darkTheme {
    return FlexThemeData.dark(
      scheme: FlexScheme.jungle,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
    );
  }

  ThemeData get _lightTheme {
    return FlexThemeData.light(
      scheme: FlexScheme.jungle,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      localizationsDelegates: SampleChatLocalizations.localizationsDelegates,
      supportedLocales: SampleChatLocalizations.supportedLocales,
      routeInformationParser: locator<AppAutoRouter>().defaultRouteParser(),
      routeInformationProvider: locator<AppAutoRouter>().routeInfoProvider(),
      routerDelegate: locator<AppAutoRouter>().delegate(
        navigatorObservers: () {
          return [];
        },
      ),
    );
  }
}
