import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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

Color evaluateButtonStatus(ButtonStatus status) {
  return status.color;
}

void insertText(String text, TextEditingController c) {
  final text = c.text;
  final textSelection = c.selection;
  final newText = text.replaceRange(
    textSelection.start,
    textSelection.end,
    text,
  );
  final myTextLength = text.length;
  c.text = newText;
  c.selection = textSelection.copyWith(
    baseOffset: textSelection.start + myTextLength,
    extentOffset: textSelection.start + myTextLength,
  );
}

void removeText(TextEditingController c) {
  final _text = c.text;
  final _textSelection = c.selection;
  final _selectionLength = _textSelection.end - _textSelection.start;

  // There is a selection.
  if (_selectionLength > 0) {
    final newText = _text.replaceRange(
      _textSelection.start,
      _textSelection.end,
      '',
    );
    c.text = newText;
    c.selection = _textSelection.copyWith(
      baseOffset: _textSelection.start,
      extentOffset: _textSelection.start,
    );
    return;
  }

  // The cursor is at the beginning.
  if (_textSelection.start == 0) {
    return;
  }

  bool isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  // Delete the previous character
  final previousCodeUnit = _text.codeUnitAt(_textSelection.start - 1);
  final offset = isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
  final newStart = _textSelection.start - offset;
  final newEnd = _textSelection.start;
  final newText = _text.replaceRange(
    newStart,
    newEnd,
    '',
  );
  c.text = newText;
  c.selection = _textSelection.copyWith(
    baseOffset: newStart,
    extentOffset: newStart,
  );
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    //SaveOffSessionAnalytic
    return false;
  } else {
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
      //LogAnalytic (ConnectivityResult.wifi)
    } else {
      return true;
      //LogAnalytic
    }
  }
}


