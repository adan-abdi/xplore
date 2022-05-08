// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:shamiri/application/core/services/helpers.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/redux/actions/update_user_state_action.dart';
import 'package:shamiri/application/redux/misc/flags.dart';
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/domain/value_objects/app_constants.dart';

class EnterOtpAction extends ReduxAction<AppState> {
  final String verificationId;
  final int? resendToken;
  final BuildContext context;

  EnterOtpAction({
    required this.verificationId,
    required this.resendToken,
    required this.context,
  });

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
    dispatch(
      UpdateUserStateAction(
          isSignedIn: false,
          pinCodeVerificationID: verificationId,
          hasDoneTour: false),
    );

    dispatch(NavigateAction.pushNamed(otpPageRoute));

    return store.state;
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
