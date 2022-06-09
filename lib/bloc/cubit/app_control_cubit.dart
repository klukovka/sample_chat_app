import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/api/firebase_api.dart';

part 'app_control_state.dart';

@injectable
class AppControlCubit extends Cubit<AppControlState> {
  final FirebaseApi _api;
  late final Stream<User?> _authState;
  AppControlCubit(
    this._api,
  ) : super(const AppControlState()) {
    _authState = _api.authState();
    _authState.listen((user) {
      emit(AppControlState(user));
    });
  }
}
