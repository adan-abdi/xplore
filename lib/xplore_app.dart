import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/core/themes/app_themes.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/core/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/xplore.dart';

class XploreApp extends StatefulWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  const XploreApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  _XploreAppState createState() => _XploreAppState();
}

class _XploreAppState extends State<XploreApp> {
  @override
  Widget build(BuildContext context) {
    sendInitialAnalyticsEvent(analytics: XploreApp.analytics);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: XploreOriginStrings.packageName,
      theme: ThemeData(
          primaryColor: XploreThemes.primaryColor,
          accentColor: XploreThemes.accentColor),
      home: XploreAppRoot(),
      navigatorObservers: <NavigatorObserver>[],
    );
  }
}
