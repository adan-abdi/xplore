// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      businessUID: json['businessUID'] as String?,
      status: $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']),
      products: json['products'] == null
          ? null
          : Product.fromJson(json['products'] as Map<String, dynamic>),
      date: json['date'] as String?,
      transactionRefId: json['transactionRefId'] as String?,
      quantityOrdered: json['quantityOrdered'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'status': _$TransactionStatusEnumMap[instance.status],
      'products': instance.products?.toJson(),
      'quantityOrdered': instance.quantityOrdered,
      'transactionRefId': instance.transactionRefId,
      'date': instance.date,
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.fulfilled: 'fulfilled',
  TransactionStatus.pending: 'pending',
};
