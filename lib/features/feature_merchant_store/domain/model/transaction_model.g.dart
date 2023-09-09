// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      buyerId: json['buyerId'] as String?,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      itemsBought: json['itemsBought'] as int?,
      amountPaid: json['amountPaid'] as int?,
      transactionDate: json['transactionDate'] as String?,
      transactionCompletedDate: json['transactionCompletedDate'] as String?,
      isFulfilled: json['isFulfilled'] as bool?,
      transactionType: json['transactionType'] as String?,
      transactionPaymentMethod: json['transactionPaymentMethod'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'buyerId': instance.buyerId,
      'product': instance.product,
      'itemsBought': instance.itemsBought,
      'amountPaid': instance.amountPaid,
      'transactionDate': instance.transactionDate,
      'transactionCompletedDate': instance.transactionCompletedDate,
      'isFulfilled': instance.isFulfilled,
      'transactionType': instance.transactionType,
      'transactionPaymentMethod': instance.transactionPaymentMethod,
    };
