part of 'login_page_cubit.dart';

enum LoginPageStatus {
  initial,
  loading,
  error,
  success,
}

class LoginPageState extends Equatable {
  final LoginPageStatus status;
  final String errorMessage;

  const LoginPageState({
    this.status = LoginPageStatus.initial,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [status, errorMessage];

  LoginPageState copyWith({
    LoginPageStatus? status,
    String? errorMessage,
  }) {
    return LoginPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
