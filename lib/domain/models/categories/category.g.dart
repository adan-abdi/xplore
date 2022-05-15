// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      businessUID: json['businessUID'] as String?,
      name: json['name'] as String?,
      referenceId: json['referenceId'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'name': instance.name,
      'referenceId': instance.referenceId,
    };
