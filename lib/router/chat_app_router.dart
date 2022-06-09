import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/config/locator.dart';
import 'package:sample_chat_app/router/app_auto_router.gr.dart';
import 'package:sample_chat_app/router/base_router.dart';

final router = locator<ChatAppRouter>();

@lazySingleton
class ChatAppRouter extends BaseRouter {
  ChatAppRouter(AppAutoRouter router) : super(router);

  Future<void> replaceWithMain() async {
    await replace(const MainRoute());
  }

  Future<void> replaceWithLogin() async {
    await replace(const LoginRoute());
  }
}
