// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:shamiri/application/redux/states/dashboard_state.dart';
import 'package:shamiri/application/redux/states/user_state.dart';

class AppState extends Equatable {
  final UserState? userState;
  final DashboardState? dashboardState;
  final Wait? wait;

  const AppState({
    this.userState,
    this.dashboardState,
    this.wait,
  });

  factory AppState.initial() => AppState(
        userState: UserState.initial(),
        dashboardState: DashboardState.initial(),
        wait: Wait(),
      );

  AppState copyWith({
    UserState? userState,
    DashboardState? dashboardState,
    Wait? wait,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      dashboardState: dashboardState ?? this.dashboardState,
      wait: wait ?? this.wait,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        userState,
        dashboardState,
        wait,
      ];
}
