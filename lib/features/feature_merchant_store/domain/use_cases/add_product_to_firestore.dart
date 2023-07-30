import 'dart:io';

import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_merchant_store/domain/repository/merchant_repository.dart';

import '../../../../core/domain/model/response_state.dart';
import '../model/product_model.dart';

class AddProductToFirestore {
  final repository = locator.get<MerchantRepository>();

  Future<void> call(
          {required ProductModel product,
          required File? productPic,
          required Function(ResponseState response) response,
          required Function onSuccess}) async =>
      await repository.addProductToFirestore(
          product: product,
          productPic: productPic,
          response: response,
          onSuccess: onSuccess);
}
