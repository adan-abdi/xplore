import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

class StoreModel {
  String? storeId;
  String? storeOwnerUid;
  String? storeName;
  List<ProductModel>? storeProducts;

  StoreModel(
      {this.storeId, this.storeOwnerUid, this.storeName, this.storeProducts});

  //  From Map
  factory StoreModel.fromMap(Map<String, dynamic> map) => StoreModel(
    storeId: map['storeId'],
    storeOwnerUid: map['storeOwnerUid'],
    storeName: map['storeName'],
    storeProducts: map['storeProducts']
  );
}

extension StoreModelExtensions on StoreModel {
  //  To Map
  Map<String, dynamic> toMap() => {
    'storeId': storeId,
    'storeOwnerUid': storeOwnerUid,
    'storeName': storeName,
    'storeProducts': storeProducts,
  };
}
