import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shamiri/domain/models/category.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "businessUID")
  String? businessUID;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "quantityInStock")
  int? quantityInStock;

  @JsonKey(name: "categories")
  List<Category>? categories;

  @JsonKey(name: "referenceId")
  String? referenceId;

  Product(this.businessUID, this.name, this.quantityInStock, this.categories, this.referenceId);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    final newProduct = Product.fromJson(snapshot.data() as Map<String, dynamic>);
    newProduct.referenceId = snapshot.reference.id;
    return newProduct;
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
