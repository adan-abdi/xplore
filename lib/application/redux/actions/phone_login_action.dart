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
import 'package:xplore/application/redux/actions/update_user_state_action.dart';
import 'package:xplore/application/redux/misc/flags.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/value_objects/app_constants.dart';
import 'package:xplore/domain/value_objects/app_error_strings.dart';
import 'package:xplore/domain/value_objects/app_exceptions_strings.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';

class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({
    required this.context,
    required this.phoneNumber,
    required this.pinCode,
  });

  final BuildContext context;
  final String phoneNumber;
  final String pinCode;

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
    if (store.state.userState!.doPinsMatch == false) {
      throw UserException(pinsDoNotMatchText);
    }
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    /// Starts a phone number verification process for the given phone number.
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle errors
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
        /// todo: Launch UIAction to collect sent pin code
        /// Should have a timer where we can forceResendCode using(resendToken)
        /// and a save button to
        ///
        String smsCode = 'xxx'; // return value of save button;
        ///
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
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
      timeout: const Duration(seconds: 60),
    );

    dispatch(
      UpdateUserStateAction(
        isSignedIn: true,
        phoneNumber: phoneNumber,
        pinCode: pinCode,
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
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('Close', XploreColors.white, context),
          ),
        );
      return error;
    }
    return error;
  }
}
