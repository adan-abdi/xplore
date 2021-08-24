import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/presentation/core/xplore_root.dart';

class XploreApp extends StatefulWidget {
  const XploreApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  _XploreAppState createState() => _XploreAppState();
}

class _XploreAppState extends State<XploreApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    sendInitialAnalyticsEvent(analytics: analytics);

    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, AppState>(
          converter: (Store<AppState> store) => store.state,
          builder: (BuildContext context, AppState state) {
            return XploreAppRoot(
              store: widget.store,
            );
          }),
    );
  }
}
