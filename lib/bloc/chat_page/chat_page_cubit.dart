import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/api/firebase_api.dart';
import 'package:sample_chat_app/bloc/base_cubit.dart';
import 'package:sample_chat_app/models/message.dart';

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
    init();
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

      _messagesSubscription = _firebaseApi
          .getMessages(
            state.chat.uid ?? '',
          )
          .listen(_listenMessages);
    });
  }

  void _listenMessages(QuerySnapshot<Map<String, dynamic>> event) {
    emit(state.copyWith(
      messages: event.docs.map((e) {
        return Message.fromJson(e.data());
      }).toList(),
    ));
    log(state.messages.length.toString());
  }

  @override
  Future<void> close() {
    _messagesSubscription.cancel();
    return super.close();
  }
}
