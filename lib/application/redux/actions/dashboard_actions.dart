// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:shamiri/application/redux/states/app_state.dart';

class DashboardAction extends ReduxAction<AppState> {
  final int? activeTransactionTab;
  final int? activeOrderTab;

  DashboardAction({
    this.activeTransactionTab,
    this.activeOrderTab,
  });

  @override
  Future<AppState?> reduce() async {
    var dashboardState = store.state.dashboardState!.copyWith(
      activeTransactionTab: activeTransactionTab ??
          store.state.dashboardState!.activeTransactionTab,
      activeOrderTab:
          activeOrderTab ?? store.state.dashboardState!.activeOrderTab,
    );
    return state.copyWith(
      dashboardState: dashboardState,
    );
  }
}
