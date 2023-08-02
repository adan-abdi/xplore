class ProductModel {
  String? productId;
  String? productName;
  String? productUnit;
  String? productStockCount;
  String? productBuyingPrice;
  String? productSellingPrice;
  String? productCategoryId;
  String? productImageUrl;
  String? productCreatedAt;

  ProductModel(
      {this.productId,
      this.productName,
      this.productUnit,
      this.productStockCount,
      this.productBuyingPrice,
      this.productSellingPrice,
      this.productCategoryId,
      this.productImageUrl,
      this.productCreatedAt});

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
      productId: map['productId'],
      productName: map['productName'],
      productUnit: map['productUnit'],
      productStockCount: map['productStockCount'],
      productBuyingPrice: map['productBuyingPrice'],
      productSellingPrice: map['productSellingPrice'],
      productCategoryId: map['productCategoryId'],
      productImageUrl: map['productImageUrl'],
      productCreatedAt: map['productCreatedAt']);
}

extension ProductModelExtension on ProductModel {
  Map<String, dynamic> toMap() => {
        'productId': productId,
        'productName': productName,
        'productUnit': productUnit,
        'productStockCount': productStockCount,
        'productBuyingPrice': productBuyingPrice,
        'productSellingPrice': productSellingPrice,
        'productCategoryId': productCategoryId,
        'productImageUrl': productImageUrl,
        'productCreatedAt': productCreatedAt,
      };
}
