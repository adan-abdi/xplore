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
      productStockCount: json['productStockCount'] as int?,
      productBuyingPrice: json['productBuyingPrice'] as int?,
      productSellingPrice: json['productSellingPrice'] as int?,
      productCategoryId: json['productCategoryId'] as String?,
      productImageUrls: (json['productImageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productDescription: json['productDescription'] as String?,
      productCreatedAt: json['productCreatedAt'] as String?,
      productVariations: (json['productVariations'] as List<dynamic>?)
          ?.map((e) => VariationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'productImageUrls': instance.productImageUrls,
      'productDescription': instance.productDescription,
      'productCreatedAt': instance.productCreatedAt,
      'productVariations': instance.productVariations,
    };
