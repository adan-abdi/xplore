// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      businessUID: json['businessUID'] as String?,
      status: $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']),
      productsMap: (json['productsMap'] as List<dynamic>)
          .map((e) => TransactionProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String?,
      transactionRefId: json['transactionRefId'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'status': _$TransactionStatusEnumMap[instance.status],
      'productsMap': instance.productsMap.map((e) => e.toJson()).toList(),
      'transactionRefId': instance.transactionRefId,
      'date': instance.date,
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.fulfilled: 'fulfilled',
  TransactionStatus.pending: 'pending',
};
