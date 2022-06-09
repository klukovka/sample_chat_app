import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_chat_app/bloc/app_cotrol/app_control_cubit.dart';
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
  late final TextEditingController _controller;

  ChatPageCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatPageCubit, ChatPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final currentUser =
            context.read<AppControlCubit>().state.currentUser?.uid;

        return Scaffold(
          appBar: AppBar(
            title: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  state.user.photo ?? '',
                  height: 24,
                  width: 24,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(state.user.name ?? ''),
              subtitle: Text(state.user.status),
            ),
          ),
          body: ListView.separated(
            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                  color: state.messages[index].userId == currentUser
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight,
                ),
                child: Text(
                  state.messages[index].text,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: state.messages.length,
          ),
          bottomSheet: ListTile(
            title: TextField(
              controller: _controller,
            ),
            trailing: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                cubit.sendMessage(
                  _controller.text,
                  currentUser ?? '',
                );
                _controller.text = '';
              },
            ),
          ),
        );
      },
    );
  }
}
