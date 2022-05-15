// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      businessUID: json['businessUID'] as String?,
      name: json['name'] as String?,
      quantityInStock: json['quantityInStock'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceId: json['referenceId'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'name': instance.name,
      'quantityInStock': instance.quantityInStock,
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'referenceId': instance.referenceId,
    };
