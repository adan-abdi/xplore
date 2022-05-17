// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShamiriUser _$ShamiriUserFromJson(Map<String, dynamic> json) => ShamiriUser(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String? ?? '@.com',
    );

Map<String, dynamic> _$ShamiriUserToJson(ShamiriUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
