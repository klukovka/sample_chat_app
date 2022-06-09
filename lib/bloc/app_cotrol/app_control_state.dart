part of 'app_control_cubit.dart';

class AppControlState extends Equatable {
  final User? currentUser;
  const AppControlState([this.currentUser]);

  @override
  List<Object?> get props => [currentUser];
}
