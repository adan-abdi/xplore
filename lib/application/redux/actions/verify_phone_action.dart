// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/actions/enter_otp_action.dart';
import 'package:xplore/application/redux/actions/update_user_state_action.dart';
import 'package:xplore/application/redux/misc/flags.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/value_objects/app_constants.dart';
import 'package:xplore/domain/value_objects/app_error_strings.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';

class VerifyPhoneAction extends ReduxAction<AppState> {
  VerifyPhoneAction({
    required this.context,
    required this.phoneNumber,
    this.pinCode,
  });

  final BuildContext context;
  final String phoneNumber;
  final String? pinCode;

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

    await firebaseAuthInstance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        await firebaseAuthInstance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            snackbar(
              content: e.message,
              label: okText,
            ),
          );
      },
      codeSent: (String verificationId, int? resendToken) async {
        store.dispatch(
          EnterOtpAction(
            context: context,
            resendToken: resendToken,
            verificationId: verificationId,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            snackbar(
              content: autoCodeResolutionError,
              label: okText,
            ),
          );
      },
      timeout: thirtySeconds,
    );

    dispatch(
      UpdateUserStateAction(
        isSignedIn: false,
        phoneNumber: phoneNumber,
      ),
    );

    return null;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == UserException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Incorrect phone  number format try again please.'),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('Close', XploreColors.white, context),
          ),
        );
      return error;
    }
    return error;
  }
}
