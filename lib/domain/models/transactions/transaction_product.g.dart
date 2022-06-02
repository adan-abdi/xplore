// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionProduct _$TransactionProductFromJson(Map<String, dynamic> json) =>
    TransactionProduct(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      transactionProductRefId: json['transactionProductRefId'] as String?,
      date: json['date'] as String?,
      businessUID: json['businessUID'] as String?,
      quantityOrdered: json['quantityOrdered'] as int,
    );

Map<String, dynamic> _$TransactionProductToJson(TransactionProduct instance) =>
    <String, dynamic>{
      'businessUID': instance.businessUID,
      'product': instance.product?.toJson(),
      'date': instance.date,
      'quantityOrdered': instance.quantityOrdered,
      'transactionProductRefId': instance.transactionProductRefId,
    };
