// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$$_UserStateFromJson(Map<String, dynamic> json) => _$_UserState(
      uid: json['uid'] as String?,
      isSignedIn: json['isSignedIn'] as bool?,
      isLastSessionActive: json['isLastSessionActive'] == null
          ? null
          : DateTime.parse(json['isLastSessionActive'] as String),
      hasDoneTour: json['hasDoneTour'] as bool?,
      phoneNumber: json['phoneNumber'] as String?,
      initialPhoneNumber: json['initialPhoneNumber'] as String?,
      pinCode: json['pinCode'] as String?,
      pinCodeVerificationID: json['pinCodeVerificationID'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      displayName: json['displayName'] as String?,
      displayInitials: json['displayInitials'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'isSignedIn': instance.isSignedIn,
      'isLastSessionActive': instance.isLastSessionActive?.toIso8601String(),
      'hasDoneTour': instance.hasDoneTour,
      'phoneNumber': instance.phoneNumber,
      'initialPhoneNumber': instance.initialPhoneNumber,
      'pinCode': instance.pinCode,
      'pinCodeVerificationID': instance.pinCodeVerificationID,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'displayInitials': instance.displayInitials,
      'email': instance.email,
    };
