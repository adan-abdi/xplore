// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:shamiri/domain/models/categories/category.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  Product({
    required this.businessUID,
    required this.name,
    required this.quantityInStock,
    required this.categories,
    required this.referenceId,
  });

  final String? businessUID;
  final String? name;
  final int? quantityInStock;
  final List<Category>? categories;
  String? referenceId;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    final newProduct =
        Product.fromJson(snapshot.data() as Map<String, dynamic>);
    newProduct.referenceId = snapshot.reference.id;
    return newProduct;
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
