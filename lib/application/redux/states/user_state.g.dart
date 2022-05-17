// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$$_UserStateFromJson(Map<String, dynamic> json) => _$_UserState(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      isSignedIn: json['isSignedIn'] as bool?,
      hasDoneTour: json['hasDoneTour'] as bool?,
      pinCodeVerificationID: json['pinCodeVerificationID'] as String?,
      isLastSessionActive: json['isLastSessionActive'] == null
          ? null
          : DateTime.parse(json['isLastSessionActive'] as String),
    );

Map<String, dynamic> _$$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'isSignedIn': instance.isSignedIn,
      'hasDoneTour': instance.hasDoneTour,
      'pinCodeVerificationID': instance.pinCodeVerificationID,
      'isLastSessionActive': instance.isLastSessionActive?.toIso8601String(),
    };
