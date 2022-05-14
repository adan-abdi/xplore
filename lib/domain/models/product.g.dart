// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['businessUID'] as String?,
      json['name'] as String?,
      json['quantityInStock'] as int?,
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['referenceId'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'name': instance.name,
      'quantityInStock': instance.quantityInStock,
      'categories': instance.categories,
      'referenceId': instance.referenceId,
    };
