import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
import 'package:xplore/presentation/onboarding/widgets/verify_otp_dialog.dart';

class PhoneSignupAction extends ReduxAction<AppState> {
  PhoneSignupAction({
    required this.context,
    required this.phoneNumber,
  });

  final BuildContext context;
  final String phoneNumber;

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(phoneSigninStateFlag));
    if (store.state.userState!.areTermsAccepted == false) {
      throw UserException(termsAcceptPrompt);
    }
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(phoneSigninStateFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    /// PhoneSignup Page ==> Collects phone Number and remember me bool value (add to authStatus)
    /// Launch modal to confirm smsCode sent
    /// 1. Check if user collection on firestore is present.
    /// 2. If not create one
    /// 3. Create a user (creates id for user collection which is different from `uid`)
    /// 4. Verify user phone number by verifying smsCode
    /// 5. Update user collection with new data (phoneNumber, smsCode)
    /// 6. Navigate to set-profile page
    /// 7. Collects user data (role, pins(2), acceptedTerms)

    /// Starts a phone number verification process for the given phone number.
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Automatic handling of the SMS code on Android devices
        await auth.signInWithCredential(credential);
      },
      codeSent: (String verificationId, int? resendToken) async {
        await getSentOTP(context);

        String smsCode = store.state.userState!.otpCode ?? '';

        if (smsCode == 'UNKNOWN' || smsCode.isEmpty) {
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential);
        } else {
          throw UserException(otpCodeNull);
        }
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
      timeout: const Duration(seconds: 60),
    );

    dispatch(
      UpdateUserStateAction(
        isSignedIn: true,
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
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('Close', white, context),
          ),
        );
      return error;
    }
    return error;
  }
}

Future<void> getSentOTP(BuildContext context) async {
  await showDialog<VerifyOTPDialog?>(
    context: context,
    builder: (BuildContext context) => VerifyOTPDialog(),
  );
}
