import 'package:async_redux/async_redux.dart';
import 'package:debug_logger/debug_logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:xplore/domain/value_objects/app_enums.dart';
import 'package:xplore/domain/value_objects/app_event_strings.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/routes/routes.dart';

/// Utility method for sending initial event to [FirebaseAnalytics]
Future<void> sendInitialAnalyticsEvent({
  required FirebaseAnalytics analytics,
}) async {
  await analytics.logAppOpen();

  await analytics.logEvent(
    name: XploreEventStrings.initialEvent,
    parameters: <String, dynamic>{
      XploreStrings.eventText: XploreEventStrings.initialEventSuccess,
    },
  );

  await analytics.setAnalyticsCollectionEnabled(true);

  await analytics.setCurrentScreen(
    screenName: XploreStrings.rootPage,
  );

  DebugLogger.warning(XploreStrings.firebaseConnectSuccess);
}

/// Gets initial route based on the userState status
Future<String> getInitialRoute({
  required BuildContext context,
  required Store store,
}) async {
  final AuthStatus tokenStatus = await getAuthStatus(
    store: store,
    context: context,
  );

  switch (tokenStatus) {
    case AuthStatus.okay:
      return homePageRoute;
    case AuthStatus.requiresLogin:
      return loginPageRoute;
    case AuthStatus.init:
      return landingPageRoute;
    default:
      return landingPageRoute;
  }
}

Future<AuthStatus> getAuthStatus({
  required BuildContext context,
  required Store store,
}) async {
  final bool hasDoneTour = store.state.userState!.hasDoneTour ?? false;
  final bool signedIn = store.state.userState!.isSignedIn ?? false;

  if (hasDoneTour == true) {
    if (signedIn == true) {
      return AuthStatus.okay;
    } else {
      return AuthStatus.requiresLogin;
    }
  } else {
    return AuthStatus.init;
  }
}
