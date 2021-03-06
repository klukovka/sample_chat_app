import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/api/firebase_api.dart';

part 'app_control_state.dart';

@injectable
class AppControlCubit extends Cubit<AppControlState> {
  final FirebaseApi _api;
  late final StreamSubscription<User?> _userSubscription;
  AppControlCubit(
    this._api,
  ) : super(const AppControlState()) {
    _userSubscription = _api.authState.listen((user) {
      log(user.toString());
      emit(AppControlState(user));
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
