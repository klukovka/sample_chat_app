import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_chat_app/bloc/chat_page/chat_page_cubit.dart';
import 'package:sample_chat_app/config/locator.dart';

class ChatPage extends StatefulWidget implements AutoRouteWrapper {
  final String userId;

  const ChatPage({
    Key? key,
    @PathParam('userId') required this.userId,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ChatPageCubit>(param1: userId),
      child: this,
    );
  }
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatPageCubit, ChatPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold();
      },
    );
  }
}
