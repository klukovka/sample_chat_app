import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/api/firebase_api.dart';
import 'package:sample_chat_app/bloc/base_cubit.dart';

part 'login_page_state.dart';

@injectable
class LoginPageCubit extends BaseCubit<LoginPageState> {
  final FirebaseApi _firebaseApi;

  LoginPageCubit(
    this._firebaseApi,
  ) : super(const LoginPageState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: LoginPageStatus.error,
    ));
  }

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(status: LoginPageStatus.loading));

    await makeErrorHandledCall(() async {
      await _firebaseApi.googleLogin();
      await _firebaseApi.createUser();
    });
  }
}
