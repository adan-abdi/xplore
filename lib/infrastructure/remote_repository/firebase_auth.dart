// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_state_button/progress_button.dart';

// Project imports:
import 'package:shamiri/application/core/services/helpers.dart';
import 'package:shamiri/application/redux/actions/update_user_state_action.dart';
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/domain/models/users/user.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_user.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';

FirebaseAuth globalFirebaseAuthInstance = FirebaseAuth.instance;

class XploreFirebaseAuth {
  void verifyOtp(String otpText, BuildContext ctx, AppState state, {bool? isSignedIn}) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: state.userState!.pinCodeVerificationID ?? '',
      smsCode: otpText,
    );
    final User? user = (await globalFirebaseAuthInstance.signInWithCredential(credential)).user;

    final User? currentUser = globalFirebaseAuthInstance.currentUser;

    if (user != null && user.uid == currentUser!.uid) {
      var remoteUserRepoInstance = UserRepository();

      final ShamiriUser newUser = ShamiriUser(
        uid: user.uid,
        name: 'Merchant Store',
        phoneNumber: user.phoneNumber,
      );

      await remoteUserRepoInstance.addUser(newUser);

      StoreProvider.dispatch(
        ctx,
        UpdateUserStateAction(
          uid: user.uid,
          isSignedIn: true,
          phoneNumber: user.phoneNumber,
        ),
      );

      appInitialRoute.initialRoute.add(
        await getInitialRoute(state: state),
      );

      StoreProvider.dispatch<AppState>(
        ctx,
        NavigateAction.pushNamed(dashPageRoute),
      );
    } else {
      phoneLoginProgressInstance.btnStatus.add(ButtonState.fail);
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar(
        content: "Sign In Failed",
      ));
    }
  }
}