// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      sellerId: json['sellerId'] as String?,
      sellerName: json['sellerName'] as String?,
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      productUnit: json['productUnit'] as String?,
      productStockCount: json['productStockCount'] as String?,
      productBuyingPrice: json['productBuyingPrice'] as String?,
      productSellingPrice: json['productSellingPrice'] as String?,
      productCategoryId: json['productCategoryId'] as String?,
      productImageUrl: json['productImageUrl'] as String?,
      productCreatedAt: json['productCreatedAt'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
      'sellerName': instance.sellerName,
      'productId': instance.productId,
      'productName': instance.productName,
      'productUnit': instance.productUnit,
      'productStockCount': instance.productStockCount,
      'productBuyingPrice': instance.productBuyingPrice,
      'productSellingPrice': instance.productSellingPrice,
      'productCategoryId': instance.productCategoryId,
      'productImageUrl': instance.productImageUrl,
      'productCreatedAt': instance.productCreatedAt,
    };
