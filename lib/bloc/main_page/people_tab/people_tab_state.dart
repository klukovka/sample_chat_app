// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'people_tab_cubit.dart';

enum PeopleTabStatus {
  error,
  success,
  loading,
}

class PeopleTabState extends Equatable {
  final PeopleTabStatus status;
  final String errorMessage;
  final List<ChatUser> users;

  const PeopleTabState({
    this.status = PeopleTabStatus.loading,
    this.errorMessage = '',
    this.users = const [],
  });

  PeopleTabState copyWith({
    PeopleTabStatus? status,
    String? errorMessage,
    List<ChatUser>? users,
  }) {
    return PeopleTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, users];
}
