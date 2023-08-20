import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_merchant_store/domain/repository/merchant_repository.dart';

import '../../../../core/domain/model/response_state.dart';
import '../model/product_model.dart';

class DeleteProductPic {
  final repo = locator.get<MerchantRepository>();

  Future<void> call(
          {required ProductModel product,
          required String imageUrl,
          required Function(ResponseState response) response}) async => await
      repo.deleteProductPic(
          product: product, imageUrl: imageUrl, response: response);
}
