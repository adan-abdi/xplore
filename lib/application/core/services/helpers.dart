import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:xplore/application/redux/actions/phone_login_action.dart';
import 'package:xplore/application/redux/actions/update_user_state_action.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_enums.dart';
import 'package:xplore/domain/value_objects/app_event_strings.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';

final Logger logger = Logger();

Future<void> sendInitialAnalyticsEvent({
  required FirebaseAnalytics analytics,
}) async {
  await analytics.logAppOpen();

  await analytics.logEvent(
    name: initialEvent,
    parameters: <String, dynamic>{
      eventText: initialEventSuccess,
    },
  );

  await analytics.setAnalyticsCollectionEnabled(true);

  await analytics.setCurrentScreen(
    screenName: rootPage,
  );

  logger.w(firebaseConnectSuccess);
}

/// Gets initial route based on the userState status
Future<String> getInitialRoute({
  required Store store,
}) async {
  final AuthStatus tokenStatus = await getAuthStatus(
    currentStore: store,
  );

  switch (tokenStatus) {
    case AuthStatus.init:
      return onboardingPageRoute;
    case AuthStatus.requiresLogin:
      return loginPageRoute;
    case AuthStatus.okay:
      return homePageRoute;
    default:
      return landingPageRoute;
  }
}

Future<AuthStatus> getAuthStatus({
  required Store currentStore,
}) async {
  final bool hasDoneTour = currentStore.state.userState!.hasDoneTour ??= false;
  final bool signedIn = currentStore.state.userState!.isSignedIn ??= false;

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

/// Phone SignUp
Future<void> signUp({
  required BuildContext context,
  required String phoneNumber,
  required String pin,
  required String confirmPin,
  required GlobalKey<FormState> formKey,
}) async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();

    if (pin == confirmPin) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateUserStateAction(doPinsMatch: true),
      );

      await StoreProvider.dispatch<AppState>(
        context,
        PhoneLoginAction(
          context: context,
          phoneNumber: phoneNumber,
          pinCode: confirmPin,
        ),
      );

      NavigateAction<AppState>.pushNamed(homePageRoute);
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackbar(
            content: comingSoonText,
            label: okText,
          ),
        );
    }
  }
}

/// Phone SignIn
Future<void> signIn({
  required BuildContext context,
  required String phoneNumber,
  required String pin,
  required String confirmPin,
  required GlobalKey<FormState> formKey,
}) async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();

    if (pin == confirmPin) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateUserStateAction(doPinsMatch: true),
      );

      await StoreProvider.dispatch<AppState>(
        context,
        PhoneLoginAction(
          context: context,
          phoneNumber: phoneNumber,
          pinCode: confirmPin,
        ),
      );

      NavigateAction<AppState>.pushNamed(homePageRoute);
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackbar(
            content: comingSoonText,
            label: okText,
          ),
        );
    }
  }
}

/// [Dismiss snackbar]
SnackBarAction dismissSnackBar(String text, Color color, BuildContext context) {
  return SnackBarAction(
    label: text,
    textColor: color,
    onPressed: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    },
  );
}
