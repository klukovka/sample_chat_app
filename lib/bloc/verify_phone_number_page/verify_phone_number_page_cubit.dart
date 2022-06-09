import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/api/firebase_api.dart';
import 'package:sample_chat_app/bloc/base_cubit.dart';

part 'verify_phone_number_page_state.dart';

@injectable
class VerifyPhoneNumberPageCubit extends BaseCubit<VerifyPhoneNumberPageState> {
  final FirebaseApi _api;

  VerifyPhoneNumberPageCubit(
    this._api,
    @factoryParam String? phoneNumber,
  ) : super(VerifyPhoneNumberPageState(
          phoneNumber: phoneNumber!,
        )) {
    verifyPhoneNumber();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: VerifyPhoneNumberPageStatus.error,
    ));
  }

  Future<void> verifyPhoneNumber() async {
    await makeErrorHandledCall(() async {
      await _api.verifyPhoneNumber(
        phoneNumber: state.phoneNumber,
        verificationCompleted: (_) {},
        verificationFailed: (ex) => handleError(ex.message ?? ''),
        codeSent: (verificationId, resendingToken) async {
          emit(state.copyWith(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (_) {},
      );
    });
  }

  Future<void> sendCode(String sms) async {
    emit(state.copyWith(status: VerifyPhoneNumberPageStatus.loading));
    await makeErrorHandledCall(() async {
      var credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId,
        smsCode: sms,
      );
      await _api.signInWithCredential(credential);
      emit(state.copyWith(status: VerifyPhoneNumberPageStatus.success));
    });
  }
}
