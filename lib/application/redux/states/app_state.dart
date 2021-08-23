import 'package:async_redux/async_redux.dart';
import 'package:equatable/equatable.dart';
import 'package:xplore/application/redux/states/onboarding_state.dart';

class AppState extends Equatable {
  final OnboardingState? onboardingState;
  final Wait? wait;

  const AppState({
    this.onboardingState,
    this.wait,
  });

  factory AppState.initial() => AppState(
        onboardingState: OnboardingState.initial(),
        wait: Wait(),
      );

  AppState copyWith({
    OnboardingState? onboardingState,
    Wait? wait,
  }) {
    return AppState(
      onboardingState: onboardingState ?? this.onboardingState,
      wait: wait ?? this.wait,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        onboardingState,
        wait,
      ];
}
