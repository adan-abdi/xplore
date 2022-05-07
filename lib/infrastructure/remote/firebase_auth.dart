import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/redux/actions/update_user_state_action.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/infrastructure/remote/firestore_db.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';

FirebaseAuth globalFirebaseAuthInstance = FirebaseAuth.instance;

class XploreFirebaseAuth {
  void verifyOtp(String otpText, BuildContext ctx, AppState state, {bool? isSignedIn}) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: state.userState!.pinCodeVerificationID ?? '',
      smsCode: otpText,
    );
    final User? user = (await globalFirebaseAuthInstance.signInWithCredential(credential)).user;

    final User? currentUser = globalFirebaseAuthInstance.currentUser;
    assert(user!.uid == currentUser!.uid);

    if (user != null) {
      var xploreRemoteDBInstance = XploreFirestore();

      await xploreRemoteDBInstance.createRemoteUserEntity();

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
