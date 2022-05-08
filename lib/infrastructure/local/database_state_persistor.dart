// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/application/redux/states/user_state.dart';
import 'package:shamiri/infrastructure/local/database_base.dart';
import 'package:shamiri/infrastructure/local/database_mobile.dart';
import 'package:shamiri/infrastructure/local/initialize_db.dart';

/// [XploreStateDatabase] is the middleware that interacts with the database on behalf
/// of the application. From the apps perspective, it doesn't care which database
/// its saving its state on. HCStateDatabase therefore offers different implementations
/// for its method.
class XploreStateDatabase implements PersistorPrinterDecorator<AppState> {
  XploreStateDatabase({
    Duration throttle = const Duration(seconds: 2),
    Duration saveDuration = Duration.zero,
    required this.dataBaseName,
  })  : _throttle = throttle,
        _saveDuration = saveDuration;

  final Duration? _saveDuration;
  final Duration? _throttle;
  final String dataBaseName;

  @override
  Duration? get throttle => _throttle;

  Duration? get saveDuration => _saveDuration;

  @override
  Future<void> deleteState() async {
    await XploreDatabaseMobile<Database>(initializeDB: InitializeDB<Database>(dbName: this.dataBaseName))
        .clearDatabase();
  }

  @override
  Future<void> persistDifference({
    AppState? lastPersistedState,
    required AppState newState,
  }) async {
    await Future<dynamic>.delayed(saveDuration!);

    if (lastPersistedState == null || lastPersistedState.userState != newState.userState) {
      await persistState(
        newState,
        XploreDatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  /// we first check whether the database is empty
  ///
  /// - if the database is empty, we return null
  /// - else, we retrieve the state from the database
  @override
  Future<AppState> readState() async {
    if (await XploreDatabaseMobile<Database>(initializeDB: InitializeDB<Database>(dbName: this.dataBaseName))
        .isDatabaseEmpty()) {
      return AppState.initial();
    } else {
      return retrieveState(
        XploreDatabaseMobile<Database>(initializeDB: InitializeDB<Database>(dbName: this.dataBaseName)),
      );
    }
  }

  @override
  Future<void> saveInitialState(AppState state) async {
    return persistDifference(newState: state);
  }

  /// initialize the database
  Future<void> init() async {
    await XploreDatabaseMobile(initializeDB: InitializeDB(dbName: this.dataBaseName)).database;
  }

  @visibleForTesting
  Future<void> persistState(AppState newState, XploreDatabaseBase<dynamic> database) async {
    // save KYC state
    await database.saveState(data: newState.userState!.toJson(), table: Tables.userState);
  }

  @visibleForTesting
  Future<AppState> retrieveState(XploreDatabaseBase<dynamic> database) async {
    return const AppState().copyWith(
      // retrieve Onboarding State
      userState: UserState.fromJson(await database.retrieveState(Tables.userState)),

      wait: Wait(),
    );
  }
}
