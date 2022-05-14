// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['businessUID'] as String?,
      json['name'] as String?,
      json['quantityInStock'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'name': instance.name,
      'quantityInStock': instance.quantityInStock,
    };
