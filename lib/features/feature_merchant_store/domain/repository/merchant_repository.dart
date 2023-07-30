import 'dart:io';

import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

import '../../../../core/domain/model/response_state.dart';

abstract class MerchantRepository {
  Future<void> addProductToFirestore(
      {required ProductModel product,
      required File? productPic,
      required Function(ResponseState response) response,
      required Function onSuccess});
}
