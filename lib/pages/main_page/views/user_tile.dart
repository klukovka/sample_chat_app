import 'package:flutter/material.dart';
import 'package:sample_chat_app/models/chat_user.dart';
import 'package:sample_chat_app/router/chat_app_router.dart';

class UserTile extends StatelessWidget {
  final ChatUser user;

  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => router.pushChatPage(user.uid ?? ''),
      title: Text(user.name ?? ''),
      subtitle: Text(user.phone ?? user.email ?? ''),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          user.photo ?? '',
          height: 48,
          width: 48,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
