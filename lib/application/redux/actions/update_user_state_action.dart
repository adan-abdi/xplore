// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/application/redux/states/user_state.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  String? uid;
  String? name;
  String? phoneNumber;
  String? email;
  bool? isSignedIn;
  bool? hasDoneTour;
  String? pinCodeVerificationID;

  UpdateUserStateAction({
    this.uid,
    this.name,
    this.phoneNumber,
    this.email,
    this.isSignedIn,
    this.hasDoneTour,
    this.pinCodeVerificationID,
  });

  @override
  AppState reduce() {
    final UserState? newUserState = store.state.userState?.copyWith.call(
      uid: this.uid ?? state.userState?.uid,
      name: this.name ?? state.userState?.name,
      phoneNumber: this.phoneNumber ?? state.userState?.phoneNumber,
      email: this.email ?? state.userState?.email,
      isSignedIn: this.isSignedIn ?? state.userState?.isSignedIn,
      hasDoneTour: this.hasDoneTour ?? state.userState?.hasDoneTour,
      pinCodeVerificationID:
          this.pinCodeVerificationID ?? state.userState?.pinCodeVerificationID,
    );

    final AppState newState = state.copyWith(userState: newUserState);
    return newState;
  }
}
