import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/core/value_objects/app_widget_keys.dart';
import 'package:xplore/infrastructure/repository/database_base.dart';
import 'package:xplore/infrastructure/repository/database_state_persistor.dart';
import 'package:xplore/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:xplore/xplore_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  final XploreStateDatabase stateDB =
      XploreStateDatabase(dataBaseName: DatabaseName);

  await stateDB.init();

  final AppState initialState = await stateDB.readState();

  // initialize a fresh database if [initialState] is `null`,
  // and populate the database with the default values for each state
  if (initialState == AppState.initial()) {
    await stateDB.saveInitialState(initialState);
  }

  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    persistor: PersistorPrinterDecorator<AppState>(stateDB),
    defaultDistinct: true,
  );

  /// Configures which error widget to show
  /// depending on weather the app is running in debug or release mode.
  ///
  /// Shows an error image (spaceman) with a prompt to call tech-support
  /// in release mode
  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    // In debug mode, use the normal error widget which shows
    if (inDebug) {
      return ErrorWidget(details.exception);
    }
    // In release builds, show error image
    return const UnrecoverableErrorWidget();
  };

  runApp(
    XploreApp(
      store: store,
    ),
  );
}
