import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xplore/presentation/routes/routes.dart';

/// Used to store misc data objects 
/// e.g. (app initial route, init)

part 'core_state.freezed.dart';
part 'core_state.g.dart';

@freezed
class CoreState with _$CoreState {
  factory CoreState({
    String? appInitialRoute,
    bool? init,
    bool? isActive,
    DateTime? activeSessionInitTime
  }) = _CoreState;

  factory CoreState.fromJson(Map<String, dynamic> json) =>
      _$CoreStateFromJson(json);

  factory CoreState.initial() => CoreState(
    appInitialRoute: onboardingPageRoute,
    init: false,
    isActive: false,
    activeSessionInitTime: DateTime.now()
      );
}

// isActive == true && (DateTime.now() - activeSessionInitTime) > 12 hours ====>>> Login
// isActive == true && (DateTime.now() - activeSessionInitTime) < 12 hours ====>>> Home
// isActive == false && (DateTime.now() - activeSessionInitTime) >/=/< 12 hours ====>>> Login