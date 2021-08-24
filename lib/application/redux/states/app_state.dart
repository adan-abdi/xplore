import 'package:async_redux/async_redux.dart';
import 'package:equatable/equatable.dart';
import 'package:xplore/application/redux/states/user_state.dart';

class AppState extends Equatable {
  final UserState? userState;
  final Wait? wait;

  const AppState({
    this.userState,
    this.wait,
  });

  factory AppState.initial() => AppState(
        userState: UserState.initial(),
        wait: Wait(),
      );

  AppState copyWith({
    UserState? userState,
    Wait? wait,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      wait: wait ?? this.wait,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        userState,
        wait,
      ];
}
