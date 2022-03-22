// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$$_UserStateFromJson(Map<String, dynamic> json) => _$_UserState(
      isSignedIn: json['isSignedIn'] as bool?,
      phoneNumber: json['phoneNumber'] as String?,
      initialPhoneNumber: json['initialPhoneNumber'] as String?,
      pinCode: json['pinCode'] as String?,
      initialPinCode: json['initialPinCode'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      displayName: json['displayName'] as String?,
      displayInitials: json['displayInitials'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'isSignedIn': instance.isSignedIn,
      'phoneNumber': instance.phoneNumber,
      'initialPhoneNumber': instance.initialPhoneNumber,
      'pinCode': instance.pinCode,
      'initialPinCode': instance.initialPinCode,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'displayInitials': instance.displayInitials,
      'email': instance.email,
    };
