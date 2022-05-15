// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@JsonSerializable(explicitToJson: true)
class UserState with _$UserState {
  factory UserState({
    String? uid,
    String? name,
    String? phoneNumber,
    String? email,
    //local
    bool? isSignedIn,
    bool? hasDoneTour,
    String? pinCodeVerificationID,
    DateTime? isLastSessionActive,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial() => UserState(
        uid: null,
        name: 'Merchant Store',
        phoneNumber: 'UNKNOWN',
        email: 'UNKNOWN',
        //local
        isSignedIn: false,
        hasDoneTour: false,
        pinCodeVerificationID: 'UNKNOWN',
        isLastSessionActive: null,
      );
}
