import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/transaction_types.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/variation_model.dart';
import 'package:shamiri/features/feature_merchant_store/domain/use_cases/merchant_use_cases.dart';

import '../../../../core/domain/model/response_state.dart';
import '../../../../core/presentation/model/product_category.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/model/product_model.dart';

class MerchantController extends GetxController {
  final useCases = locator.get<MerchantUseCases>();

  final merchantProducts = <ProductModel>[].obs;
  final productPic = Rxn<File>();

  final productPicsFromStorage = <File>[].obs;
  final uploadButtonLoading = false.obs;
  final deleteImageLoading = false.obs;

  final activeTransactionType = TransactionTypes.pending.obs;

  /// Active Category
  final activeCategory = Constants.productCategories[0].obs;

  /// Variations
  final productVariations = <VariationModel>[].obs;

  void toggleProductVariation({required VariationModel variation}) {
    if (productVariations.contains(variation)) {
      productVariations.removeWhere((v) => v == variation);
    } else {
      productVariations.add(variation);
    }
  }

  void addProductVariation({required VariationModel variation}) {
    if (!productVariations.contains(variation)) {
      productVariations.add(variation);
    }
  }

  void updateProductVariation(
      {required int index, required VariationModel variation}) {
    productVariations[index] = variation;
  }

  void clearProductVariations() => productVariations.clear();

  void setProductPic({required File? file}) => productPic.value = file;

  void addProductPictures({required List<File>? files}) {
    if (files != null) {
      for (File file in files) {
        if (!productPicsFromStorage.contains(file)) {
          productPicsFromStorage.add(file);
        }
      }
    }
  }

  void clearPickedProductPics() {
    productPicsFromStorage.clear();
  }

  void deleteProductPic({required File? file}) {
    if (file != null) {
      productPicsFromStorage.removeWhere((fl) => fl == file);
    }
  }

  void setProducts({required List<ProductModel> products}) =>
      this.merchantProducts.value = products;

  void setUploadButtonLoading({required bool isLoading}) =>
      uploadButtonLoading.value = isLoading;

  void setDeleteImageLoading({required bool isLoading}) =>
      deleteImageLoading.value = isLoading;

  void setActiveTransactionType({required TransactionTypes transactionType}) =>
      activeTransactionType.value = transactionType;

  void setActiveCategory(ProductCategory category) =>
      activeCategory.value = category;

  double get calculateTotalStock {
    if (merchantProducts.isNotEmpty) {
      final totalItemSellingPrices = merchantProducts
          .where((product) => product.productSellingPrice != null)
          .map((product) =>
              product.productSellingPrice! * product.productStockCount!)
          .reduce((value, element) => value + element);
      return totalItemSellingPrices.toDouble();
    }

    return 0.0;
  }

  Future<void> addProductToFirestore(
      {required ProductModel product,
      required List<File>? productPics,
      required Function(ResponseState response) response,
      required Function onUploadComplete,
      Function(double bytesTransferred)? onTransfer,
      required Function onSuccess}) async {
    await useCases.addProductToFirestore.call(
        product: product,
        productPics: productPics,
        response: response,
        onUploadComplete: onUploadComplete,
        onTransfer: onTransfer,
        onSuccess: onSuccess);
  }

  Future<void> updateProduct(
          {required ProductModel oldProduct,
          required ProductModel newProduct,
          List<File>? productPics,
          Function? onUploadComplete,
          Function(double bytesTransferred)? onTransfer,
          required Function(ResponseState response) response}) async =>
      await useCases.updateProduct.call(
          oldProduct: oldProduct,
          newProduct: newProduct,
          productPics: productPics,
          onUploadComplete: onUploadComplete,
          onTransfer: onTransfer,
          response: response);

  Future<void> deleteProduct({required String productId}) async =>
      await useCases.deleteProduct.call(productId: productId);

  Future<void> deleteProductPicFromStorage(
          {required ProductModel product,
          required String imageUrl,
          required Function(ResponseState response) response}) async =>
      await useCases.deleteProductPic
          .call(product: product, imageUrl: imageUrl, response: response);

  Stream<QuerySnapshot> getMerchantProducts() => useCases.getMerchantProducts();
}
