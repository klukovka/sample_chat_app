import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_chat_app/utils/extensions/build_context_ext.dart';

import '../../router/app_auto_router.gr.dart';

enum MainMenuItemType {
  chats,
  calls,
  person,
  settings;

  IconData get iconData {
    switch (this) {
      case MainMenuItemType.chats:
        return Icons.chat;
      case MainMenuItemType.calls:
        return Icons.call;
      case MainMenuItemType.person:
        return Icons.person;
      case MainMenuItemType.settings:
        return Icons.settings;
    }
  }

  PageRouteInfo getRoute() {
    switch (this) {
      case MainMenuItemType.chats:
        return const ChatsRoute();
      case MainMenuItemType.calls:
        return const CallsRoute();
      case MainMenuItemType.person:
        return const PersonRoute();
      case MainMenuItemType.settings:
        return const SettingsRoute();
    }
  }

  String getLabel(BuildContext context) {
    switch (this) {
      case MainMenuItemType.chats:
        return context.strings.chats;
      case MainMenuItemType.calls:
        return context.strings.calls;
      case MainMenuItemType.person:
        return context.strings.person;
      case MainMenuItemType.settings:
        return context.strings.settings;
    }
  }

  BottomNavigationBarItem getBottomNavigationBarItem(BuildContext context) {
    return BottomNavigationBarItem(
      label: getLabel(context),
      icon: Icon(iconData),
    );
  }
}
