import 'package:debug_logger/debug_logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> sendInitialAnalyticsEvent({
  required FirebaseAnalytics analytics,
}) async {
  await analytics.logAppOpen();

  // /// todo: Use this on Login/SignUp
  // await analytics.logLogin(); and // logSignUp

  await analytics.logEvent(
    name: 'initial_event',
    parameters: <String, dynamic>{
      'Event': 'Application successfully connected to Firebase',
    },
  );

  await analytics.setAnalyticsCollectionEnabled(true);

  await analytics.setCurrentScreen(
    screenName: 'Xplore Root',
  );

  DebugLogger.warning('Application successfully connects to Firebase');
}
