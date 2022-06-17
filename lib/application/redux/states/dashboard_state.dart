// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';
part 'dashboard_state.g.dart';

@freezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    int? activeTransactionTab,
    int? activeOrderTab,
  }) = _DashboardState;

  factory DashboardState.initial() => DashboardState(
        activeTransactionTab: 0,
        activeOrderTab: 0,
      );

  factory DashboardState.fromJson(Map<String, dynamic> json) =>
      _$DashboardStateFromJson(json);
}
