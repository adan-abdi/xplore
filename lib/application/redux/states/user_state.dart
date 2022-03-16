// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    bool? isSignedIn,
    bool? hasDoneTour,
    String? phoneNumber,
    String? pinCode,
    String? initialPinCode,
    String? confirmPinCode,
    bool? doPinsMatch,
    String? firstName,
    String? lastName,
    String? displayName,
    String? displayInitials,
    String? email,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial() => UserState(
        hasDoneTour: false,
        isSignedIn: false,
        phoneNumber: 'UNKNOWN',
        pinCode: 'UNKNOWN',
        confirmPinCode: 'UNKNOWN',
        doPinsMatch: false,
        firstName: 'UNKNOWN',
        lastName: 'UNKNOWN',
        displayName: 'UNKNOWN',
        displayInitials: 'UU',
        email: 'UNKNOWN',
      );
}
