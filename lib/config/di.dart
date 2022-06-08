import 'dart:core';

import 'package:injectable/injectable.dart';

import '../router/app_auto_router.gr.dart';
import 'di.config.dart';
import 'locator.dart';

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
  ignoreUnregisteredTypes: [AppAutoRouter],
)
Future<void> configureDependencies() async {
  locator.registerSingleton<AppAutoRouter>(AppAutoRouter());
  $configureDependencies(locator);
}
