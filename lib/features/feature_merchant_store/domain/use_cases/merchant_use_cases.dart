import 'package:shamiri/features/feature_merchant_store/domain/use_cases/add_product_to_firestore.dart';

import 'delete_product.dart';
import 'get_merchant_products.dart';

class MerchantUseCases {
  final AddProductToFirestore addProductToFirestore;
  final GetMerchantProducts getMerchantProducts;
  final DeleteProduct deleteProduct;

  MerchantUseCases(
      {required this.addProductToFirestore,
      required this.getMerchantProducts,
      required this.deleteProduct});
}
