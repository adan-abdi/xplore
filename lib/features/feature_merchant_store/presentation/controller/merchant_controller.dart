import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_merchant_store/domain/use_cases/merchant_use_cases.dart';

import '../../../../core/domain/model/response_state.dart';
import '../../domain/model/product_model.dart';

class MerchantController extends GetxController {
  final useCases = locator.get<MerchantUseCases>();

  final productPic = Rxn<File>();
  final uploadButtonLoading = false.obs;

  void setProductPic({required File file}) => productPic.value = file;

  void setUploadButtonLoading({required bool isLoading}) =>
      uploadButtonLoading.value = isLoading;

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

  Stream<QuerySnapshot> getMerchantProducts() => useCases.getMerchantProducts();
}
