// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String?,
      quantityInStock: json['quantityInStock'] as String,
      sellingPrice: json['sellingPrice'] as String?,
      buyingPrice: json['buyingPrice'] as String?,
      quantityOrdered: json['quantityOrdered'] as String?,
      metricUnit: json['metricUnit'] as String?,
      businessUID: json['businessUID'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageList: (json['imageList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productRefID: json['productRefID'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'name': instance.name,
      'quantityInStock': instance.quantityInStock,
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'imageList': instance.imageList,
      'sellingPrice': instance.sellingPrice,
      'buyingPrice': instance.buyingPrice,
      'metricUnit': instance.metricUnit,
      'quantityOrdered': instance.quantityOrdered,
      'productRefID': instance.productRefID,
    };
