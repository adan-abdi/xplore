// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    String? uid,
    bool? isSignedIn,
    DateTime? isLastSessionActive,
    bool? hasDoneTour,
    String? phoneNumber,
    String? initialPhoneNumber,
    String? pinCode,
    String? pinCodeVerificationID,
    String? firstName,
    String? lastName,
    String? displayName,
    String? displayInitials,
    String? email,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial() => UserState(
        uid: null,
        isSignedIn: false,
        isLastSessionActive: null,
        hasDoneTour: false,
        phoneNumber: 'UNKNOWN',
        initialPhoneNumber: 'UNKNOWN',
        pinCode: 'UNKNOWN',
        pinCodeVerificationID: 'UNKNOWN',
        firstName: 'UNKNOWN',
        lastName: 'UNKNOWN',
        displayName: 'UNKNOWN',
        displayInitials: 'UU',
        email: 'UNKNOWN',
      );
}
