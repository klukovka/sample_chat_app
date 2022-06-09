import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_chat_app/api/firebase_api.dart';
import 'package:sample_chat_app/bloc/base_cubit.dart';
import 'package:sample_chat_app/models/chat_user.dart';

part 'people_tab_state.dart';

@injectable
class PeopleTabCubit extends BaseCubit<PeopleTabState> {
  final FirebaseApi _api;
  late final StreamSubscription _peopleSubscription;

  PeopleTabCubit(
    this._api,
  ) : super(const PeopleTabState()) {
    _peopleSubscription = _api.people.listen(
      _listenPeople,
      onError: (error) => handleError(error.toString()),
      onDone: () => emit(state.copyWith(
        status: PeopleTabStatus.success,
      )),
    );
  }

  void _listenPeople(QuerySnapshot<Map<String, dynamic>> event) {
    emit(state.copyWith(
      users: event.docs.map((e) {
        return ChatUser.fromMap(e.data());
      }).toList(),
    ));
  }

  @override
  Future<void> close() {
    _peopleSubscription.cancel();
    return super.close();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: PeopleTabStatus.error,
    ));
  }
}
