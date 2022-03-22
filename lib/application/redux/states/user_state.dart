// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    bool? isSignedIn,
    String? phoneNumber,
    String? initialPhoneNumber,
    String? pinCode,
    String? initialPinCode,
    String? firstName,
    String? lastName,
    String? displayName,
    String? displayInitials,
    String? email,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial() => UserState(
        isSignedIn: false,
        phoneNumber: 'UNKNOWN',
        initialPhoneNumber: 'UNKNOWN',
        pinCode: 'UNKNOWN',
        initialPinCode: 'UNKNOWN',
        firstName: 'UNKNOWN',
        lastName: 'UNKNOWN',
        displayName: 'UNKNOWN',
        displayInitials: 'UU',
        email: 'UNKNOWN',
      );
}
