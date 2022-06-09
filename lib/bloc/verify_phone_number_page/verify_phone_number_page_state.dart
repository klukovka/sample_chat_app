// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'verify_phone_number_page_cubit.dart';

enum VerifyPhoneNumberPageStatus {
  initial,
  loading,
  success,
  error,
}

class VerifyPhoneNumberPageState extends Equatable {
  final VerifyPhoneNumberPageStatus status;
  final String errorMessage;
  final String verificationId;
  final String phoneNumber;

  const VerifyPhoneNumberPageState({
    required this.phoneNumber,
    this.status = VerifyPhoneNumberPageStatus.initial,
    this.errorMessage = '',
    this.verificationId = '',
  });

  VerifyPhoneNumberPageState copyWith({
    VerifyPhoneNumberPageStatus? status,
    String? errorMessage,
    String? verificationId,
    String? phoneNumber,
  }) {
    return VerifyPhoneNumberPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      verificationId: verificationId ?? this.verificationId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, verificationId, phoneNumber];
}
