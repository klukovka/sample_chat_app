import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/config/locator.dart';
import 'package:sample_chat_app/router/app_auto_router.gr.dart';
import 'package:sample_chat_app/router/base_router.dart';

final router = locator<ChatAppRouter>();

@lazySingleton
class ChatAppRouter extends BaseRouter {
  ChatAppRouter(AppAutoRouter router) : super(router);

  Future<void> pushEditPhoneNumberPage() async {
    await push(const EditPhoneNumberRoute());
  }

  Future<void> pushSelectCountryPage(
    ValueSetter<Map<String, dynamic>> onSelected,
  ) async {
    await push(SelectCountryRoute(
      onSelected: onSelected,
    ));
  }
}
