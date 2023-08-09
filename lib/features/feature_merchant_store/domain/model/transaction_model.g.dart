// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      buyerId: json['buyerId'] as String?,
      productId: json['productId'] as String?,
      itemsBought: json['itemsBought'] as int?,
      amountPaid: json['amountPaid'] as int?,
      transactionDate: json['transactionDate'] as String?,
      isFulfilled: json['isFulfilled'] as bool?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'buyerId': instance.buyerId,
      'productId': instance.productId,
      'itemsBought': instance.itemsBought,
      'amountPaid': instance.amountPaid,
      'transactionDate': instance.transactionDate,
      'isFulfilled': instance.isFulfilled,
    };
