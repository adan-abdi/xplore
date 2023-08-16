import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/transaction_types.dart';
import 'package:shamiri/features/feature_merchant_store/domain/use_cases/merchant_use_cases.dart';

import '../../../../core/domain/model/response_state.dart';
import '../../../../core/presentation/model/product_category.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/model/product_model.dart';

class MerchantController extends GetxController {
  final useCases = locator.get<MerchantUseCases>();

  final merchantProducts = <ProductModel>[].obs;
  final productPic = Rxn<File>();
  final uploadButtonLoading = false.obs;

  final activeTransactionType = TransactionTypes.pending.obs;

  /// Active Category
  final activeCategory = Constants.productCategories[0].obs;

  void setProductPic({required File? file}) => productPic.value = file;

  void setProducts({required List<ProductModel> products}) =>
      this.merchantProducts.value = products;

  void setUploadButtonLoading({required bool isLoading}) =>
      uploadButtonLoading.value = isLoading;

  void setActiveTransactionType({required TransactionTypes transactionType}) =>
      activeTransactionType.value = transactionType;

  void setActiveCategory(ProductCategory category) =>
      activeCategory.value = category;

  double get calculateTotalStock {
    if (merchantProducts.isNotEmpty) {
      final totalItemSellingPrices = merchantProducts
          .map((product) => product.productSellingPrice! * product.productStockCount!)
          .reduce((value, element) => value + element);

      return totalItemSellingPrices.roundToDouble();
    }

    return 0.0;
  }

  Future<void> addProductToFirestore(
      {required ProductModel product,
      required File? productPic,
      required Function(ResponseState response) response,
      required Function onSuccess}) async {
    await useCases.addProductToFirestore.call(
        product: product,
        productPic: productPic,
        response: response,
        onSuccess: onSuccess);
  }

  Future<void> updateProduct(
          {required ProductModel oldProduct,
          required ProductModel newProduct,
          required Function(ResponseState response) response}) async =>
      await useCases.updateProduct.call(
          oldProduct: oldProduct, newProduct: newProduct, response: response);

  Future<void> deleteProduct({required String productId}) async =>
      await useCases.deleteProduct.call(productId: productId);

  Stream<QuerySnapshot> getMerchantProducts() => useCases.getMerchantProducts();
}
