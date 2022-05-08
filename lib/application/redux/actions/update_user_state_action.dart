// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/application/redux/states/user_state.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  String? uid;
  bool? isSignedIn;
  bool? hasDoneTour;
  String? phoneNumber;
  String? initialPhoneNumber;
  String? pinCode;
  String? pinCodeVerificationID;
  String? firstName;
  String? lastName;
  String? displayName;
  String? displayInitials;
  String? email;

  UpdateUserStateAction({
    this.uid,
    this.isSignedIn,
    this.hasDoneTour,
    this.phoneNumber,
    this.initialPhoneNumber,
    this.pinCode,
    this.pinCodeVerificationID,
    this.firstName,
    this.lastName,
    this.displayName,
    this.displayInitials,
    this.email,
  });

  @override
  AppState reduce() {
    final UserState? newUserState = store.state.userState?.copyWith.call(
      uid: this.uid ?? state.userState?.uid,
      firstName: this.firstName ?? state.userState?.firstName,
      lastName: this.lastName ?? state.userState?.lastName,
      displayName: this.displayName ?? state.userState?.displayName,
      displayInitials: this.displayInitials ?? state.userState?.displayInitials,
      email: this.email ?? state.userState?.email,
      isSignedIn: this.isSignedIn ?? state.userState?.isSignedIn,
      hasDoneTour: this.hasDoneTour ?? state.userState?.hasDoneTour,
      phoneNumber: this.phoneNumber ?? state.userState?.phoneNumber,
      initialPhoneNumber:
          this.initialPhoneNumber ?? state.userState?.initialPhoneNumber,
      pinCode: this.pinCode ?? state.userState?.pinCode,
      pinCodeVerificationID:
          this.pinCodeVerificationID ?? state.userState?.pinCodeVerificationID,
    );

    final AppState newState = state.copyWith(userState: newUserState);
    return newState;
  }
}
