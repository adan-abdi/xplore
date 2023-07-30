import 'dart:io';

import 'package:shamiri/features/feature_merchant_store/domain/repository/merchant_repository.dart';

import '../../../../core/domain/model/response_state.dart';
import '../../domain/model/product_model.dart';

class MerchantRepositoryImpl implements MerchantRepository {
  /// Add Product to Firestore
  @override
  Future<void> addProductToFirestore(
      {required ProductModel product,
      required File? productPic,
      required Function(ResponseState response) response,
      required Function onSuccess}) async {


  }
}
