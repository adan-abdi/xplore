// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:shamiri/domain/models/categories/category.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  Product({
    required this.name,
    required this.quantityInStock,
    required this.sellingPrice,
    this.buyingPrice,
    this.quantityOrdered,
    this.metricUnit,
    this.businessUID,
    this.categories,
    this.imageList,
    this.productRefID,
  });

  final String? businessUID;
  final String? name;
  final String quantityInStock;
  final List<Category>? categories;
  final List<String>? imageList;
  final String? sellingPrice;
  final String? buyingPrice;
  final String? metricUnit;
  String? quantityOrdered;
  String? productRefID;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    final newProduct =
        Product.fromJson(snapshot.data() as Map<String, dynamic>);
    newProduct.productRefID = snapshot.reference.id;
    return newProduct;
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
