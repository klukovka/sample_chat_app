import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_chat_app/bloc/app_cotrol/app_control_cubit.dart';
import 'package:sample_chat_app/bloc/chat_page/chat_page_cubit.dart';
import 'package:sample_chat_app/config/locator.dart';
import 'package:sample_chat_app/pages/chat_page/views/message_tile.dart';

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
  late final TextEditingController _textController;

  ChatPageCubit get cubit => context.read();
  String get _currentUser =>
      context.read<AppControlCubit>().state.currentUser?.uid ?? '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatPageCubit, ChatPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 76),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListView.separated(
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (_, index) => MessageTile(
                  message: state.messages[index],
                  isCurrent: _currentUser == state.messages[index].userId,
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: state.messages.length,
              ),
            ),
          ),
          bottomSheet: ListTile(
            title: TextField(
              controller: _textController,
              maxLines: null,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                cubit.sendMessage(
                  _textController.text,
                  _currentUser,
                );
                _textController.text = '';
              },
            ),
          ),
        );
      },
    );
  }
}
