// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_UserState _$_$_UserStateFromJson(Map<String, dynamic> json) {
  return _$_UserState(
    isSignedIn: json['isSignedIn'] as bool?,
    hasDoneTour: json['hasDoneTour'] as bool?,
    phoneNumber: json['phoneNumber'] as String?,
    pinCode: json['pinCode'] as String?,
    initialPinCode: json['initialPinCode'] as String?,
    confirmPinCode: json['confirmPinCode'] as String?,
    doPinsMatch: json['doPinsMatch'] as bool?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    displayName: json['displayName'] as String?,
    displayInitials: json['displayInitials'] as String?,
    email: json['email'] as String?,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'isSignedIn': instance.isSignedIn,
      'hasDoneTour': instance.hasDoneTour,
      'phoneNumber': instance.phoneNumber,
      'pinCode': instance.pinCode,
      'initialPinCode': instance.initialPinCode,
      'confirmPinCode': instance.confirmPinCode,
      'doPinsMatch': instance.doPinsMatch,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'displayInitials': instance.displayInitials,
      'email': instance.email,
    };
