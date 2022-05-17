// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String?,
      businessUID: json['businessUID'] as String?,
    )..categoryRefId = json['categoryRefId'] as String?;

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'name': instance.name,
      'categoryRefId': instance.categoryRefId,
    };
