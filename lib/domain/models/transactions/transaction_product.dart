// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:shamiri/domain/models/products/product.dart';

part 'transaction_product.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionProduct {
  TransactionProduct({
    required this.product,
    required this.transactionProductRefId,
    required this.date,
    required this.businessUID,
    required this.quantityOrdered,
  });

  final String? businessUID;
  final Product? product;
  final String? date;
  final int quantityOrdered;
  String? transactionProductRefId;

  factory TransactionProduct.fromJson(Map<String, dynamic> json) =>
      _$TransactionProductFromJson(json);

  factory TransactionProduct.fromSnapshot(DocumentSnapshot snapshot) {
    final newTransaction =
        TransactionProduct.fromJson(snapshot.data() as Map<String, dynamic>);
    newTransaction.transactionProductRefId = snapshot.reference.id;
    return newTransaction;
  }

  Map<String, dynamic> toJson() => _$TransactionProductToJson(this);
}
