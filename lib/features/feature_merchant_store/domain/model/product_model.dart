import 'package:json_annotation/json_annotation.dart';

///  flutter packages pub run build_runner build
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'sellerId')
  String? sellerId;

  @JsonKey(name: 'sellerName')
  String? sellerName;

  @JsonKey(name: 'productId')
  String? productId;

  @JsonKey(name: 'productName')
  String? productName;

  @JsonKey(name: 'productUnit')
  String? productUnit;

  @JsonKey(name: 'productStockCount')
  int? productStockCount;

  @JsonKey(name: 'productBuyingPrice')
  int? productBuyingPrice;

  @JsonKey(name: 'productSellingPrice')
  int? productSellingPrice;

  @JsonKey(name: 'productCategoryId')
  String? productCategoryId;

  @JsonKey(name: 'productImageUrl')
  String? productImageUrl;

  @JsonKey(name: 'productDescription')
  String? productDescription;

  @JsonKey(name: 'productCreatedAt')
  String? productCreatedAt;

  ProductModel(
      {this.sellerId,
      this.sellerName,
      this.productId,
      this.productName,
      this.productUnit,
      this.productStockCount,
      this.productBuyingPrice,
      this.productSellingPrice,
      this.productCategoryId,
      this.productImageUrl,
        this.productDescription,
      this.productCreatedAt});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
