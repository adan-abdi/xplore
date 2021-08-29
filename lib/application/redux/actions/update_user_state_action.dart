import 'package:async_redux/async_redux.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/application/redux/states/user_state.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  bool? isSignedIn;
  bool? hasDoneTour;
  bool? areTermsAccepted;
  String? phoneNumber;
  String? pinCode;
  String? confirmPinCode;
  bool? doPinsMatch;
  String? firstName;
  String? lastName;
  String? displayName;
  String? displayInitials;
  String? email;

  UpdateUserStateAction({
    this.isSignedIn,
    this.hasDoneTour,
    this.areTermsAccepted,
    this.phoneNumber,
    this.pinCode,
    this.confirmPinCode,
    this.doPinsMatch,
    this.firstName,
    this.lastName,
    this.displayName,
    this.displayInitials,
    this.email,
  });

  @override
  AppState reduce() {
    final UserState? newUserState = store.state.userState?.copyWith.call(
      isSignedIn: this.isSignedIn ?? state.userState?.isSignedIn,
      hasDoneTour: this.hasDoneTour ?? state.userState?.hasDoneTour,
      areTermsAccepted:
          this.areTermsAccepted ?? state.userState?.areTermsAccepted,
      phoneNumber: this.phoneNumber ?? state.userState?.phoneNumber,
      pinCode: this.pinCode ?? state.userState?.pinCode,
      confirmPinCode: this.confirmPinCode ?? state.userState?.confirmPinCode,
      doPinsMatch: this.doPinsMatch ?? state.userState?.doPinsMatch,
      firstName: this.firstName ?? state.userState?.firstName,
      lastName: this.lastName ?? state.userState?.lastName,
      displayName: this.displayName ?? state.userState?.displayName,
      displayInitials: this.displayInitials ?? state.userState?.displayInitials,
      email: this.email ?? state.userState?.email,
    );

    final AppState newState = state.copyWith(userState: newUserState);
    return newState;
  }
}
