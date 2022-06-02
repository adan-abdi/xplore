// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      businessUID: json['businessUID'] as String?,
      status: $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']),
      productsList: (json['productsList'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..transactionRefId = json['transactionRefId'] as String?;

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'businessUID': instance.businessUID,
      'status': _$TransactionStatusEnumMap[instance.status],
      'productsList': instance.productsList.map((e) => e.toJson()).toList(),
      'transactionRefId': instance.transactionRefId,
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.fulfilled: 'fulfilled',
  TransactionStatus.pending: 'pending',
};
