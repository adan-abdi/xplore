import 'package:json_annotation/json_annotation.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/variation_model.dart';

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

  @JsonKey(name: 'productImageUrls')
  List<String>? productImageUrls;

  @JsonKey(name: 'productDescription')
  String? productDescription;

  @JsonKey(name: 'productCreatedAt')
  String? productCreatedAt;

  @JsonKey(name: 'productVariations')
  List<VariationModel>? productVariations;

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
      this.productImageUrls,
      this.productDescription,
      this.productCreatedAt,
      this.productVariations});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
