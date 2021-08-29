import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/value_objects/app_widget_keys.dart';
import 'package:xplore/infrastructure/database_base.dart';
import 'package:xplore/infrastructure/database_state_persistor.dart';
import 'package:xplore/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:xplore/xplore_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  final XploreStateDatabase stateDB =
      XploreStateDatabase(dataBaseName: DatabaseName);

  await stateDB.init();

  final AppState initialState = await stateDB.readState();

  // Initialize a fresh database if [initialState] is `null`,
  // and populate the database with the default values for each state object
  if (initialState == AppState.initial()) {
    await stateDB.saveInitialState(initialState);
  }

  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    persistor: PersistorPrinterDecorator<AppState>(stateDB),
    defaultDistinct: true,
  );

  // Configures which error widget to show in prod
  // Shows an error image with a prompt to call tech-support
  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());

    if (inDebug) {
      return ErrorWidget(details.exception);
    }

    return const UnrecoverableErrorWidget();
  };

  runApp(
    XploreApp(
      store: store,
    ),
  );
}
