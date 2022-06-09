import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/api/firebase_api.dart';
import 'package:sample_chat_app/bloc/base_cubit.dart';

part 'chat_page_state.dart';

@injectable
class ChatPageCubit extends BaseCubit<ChatPageState> {
  final FirebaseApi _firebaseApi;
  late final String _userId;
  late final StreamSubscription _chatSubscription;
  ChatPageCubit(
    this._firebaseApi,
    @factoryParam String? userId,
  ) : super(ChatPageState()) {
    _userId = userId!;
    init();
  }

  @override
  void handleError(String errorMessage) {
    // TODO: implement handleError
  }

  Future<void> init() async {
    await makeErrorHandledCall(() async {
      final chat = await _firebaseApi.getChatWithUser(_userId);
      _chatSubscription = chat.listen((event) {
        log(event.docs.length.toString());
      });
    });
  }

  @override
  Future<void> close() {
    _chatSubscription.cancel();
    return super.close();
  }
}
