import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/api/firebase_api.dart';
import 'package:sample_chat_app/bloc/base_cubit.dart';
import 'package:sample_chat_app/models/message.dart';
import 'package:uuid/uuid.dart';

import '../../models/chat.dart';
import '../../models/chat_user.dart';

part 'chat_page_state.dart';

@injectable
class ChatPageCubit extends BaseCubit<ChatPageState> {
  final FirebaseApi _firebaseApi;
  late final String _userId;
  late final StreamSubscription _messagesSubscription;
  ChatPageCubit(
    this._firebaseApi,
    @factoryParam String? userId,
  ) : super(const ChatPageState()) {
    _userId = userId!;
    init().whenComplete(() {
      _messagesSubscription = _firebaseApi
          .getMessages(state.chat.uid ?? '')
          .listen(_listenMessages);
    });
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: ChatPageStatus.error,
    ));
  }

  Future<void> init() async {
    await makeErrorHandledCall(() async {
      final chat =
          (await _firebaseApi.getChatWithUser(_userId)).docs.first.data();
      final user = (await _firebaseApi.getUser(_userId)).docs.first.data();
      emit(state.copyWith(
        status: ChatPageStatus.success,
        chat: Chat.fromJson(chat),
        user: ChatUser.fromJson(user),
      ));
    });
  }

  Future<void> sendMessage(
    String text,
    String currentUserId,
  ) async {
    await makeErrorHandledCall(() async {
      final user =
          (await _firebaseApi.getUser(currentUserId)).docs.first.data();

      final message = Message(
        text: text,
        createdAt: DateTime.now(),
        userId: currentUserId,
        chatId: state.chat.uid ?? '',
        user: ChatUser.fromJson(user),
        uid: const Uuid().v4(),
      );

      await _firebaseApi.sendMessage(message);
    });
  }

  void _listenMessages(QuerySnapshot<Map<String, dynamic>> event) {
    emit(state.copyWith(
      messages: event.docs.map((e) {
        return Message.fromJson(e.data());
      }).toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)),
    ));
  }

  @override
  Future<void> close() {
    _messagesSubscription.cancel();
    return super.close();
  }
}
