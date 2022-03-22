// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/application/redux/states/user_state.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  bool? isSignedIn;
  String? phoneNumber;
  String? initialPhoneNumber;
  String? pinCode;
  String? initialPinCode;
  String? firstName;
  String? lastName;
  String? displayName;
  String? displayInitials;
  String? email;

  UpdateUserStateAction({
    this.isSignedIn,
    this.phoneNumber,
    this.pinCode,
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
      phoneNumber: this.phoneNumber ?? state.userState?.phoneNumber,
      pinCode: this.pinCode ?? state.userState?.pinCode,
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
