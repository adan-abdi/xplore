import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "businessUID")
  final String? businessUID;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "quantityInStock")
  final int? quantityInStock;

  Product(this.businessUID, this.name, this.quantityInStock);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
