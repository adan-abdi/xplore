// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_state_button/progress_button.dart';

// Project imports:
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/actions/update_user_state_action.dart';
import 'package:xplore/application/redux/misc/flags.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_constants.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';

class SignInUserAction extends ReduxAction<AppState> {
  SignInUserAction({
    required this.context,
    required this.otp,
  });

  final BuildContext context;
  final String otp;

  @override
  Future<void> before() async {
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
    // todo: check internet connectivity
    // await checkInternet();
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    if (await checkInternet()) {
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: state.userState!.pinCodeVerificationID ?? '',
          smsCode: otp,
        );
        final User? user =
            (await globalFirebaseAuthInstance.signInWithCredential(credential))
                .user;
        final User? currentUser = globalFirebaseAuthInstance.currentUser;
        assert(user!.uid == currentUser!.uid);

        if (user != null) {
          StoreProvider.dispatch(
              context,
              UpdateUserStateAction(
                isSignedIn: true,
                phoneNumber: user.phoneNumber,
                uid: user.uid,
              ));

          appInitialRoute.initialRoute.add(
            await getInitialRoute(state: state),
          );

          StoreProvider.dispatch<AppState>(
            context,
            NavigateAction.pushNamed(dashPageRoute),
          );
        } else {
          phoneLoginProgressInstance.btnStatus.add(ButtonState.fail);
          ScaffoldMessenger.of(context).showSnackBar(snackbar(
            content: "Sign In Failed",
          ));
        }
      } catch (e) {
        phoneLoginProgressInstance.btnStatus.add(ButtonState.fail);
        ScaffoldMessenger.of(context).showSnackBar(snackbar(
          content: e.toString(),
        ));
      }
    } else {
      phoneLoginProgressInstance.btnStatus.add(ButtonState.fail);
      ScaffoldMessenger.of(context).showSnackBar(snackbar(
        content: "No Internet Connection!",
      ));
    }
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
