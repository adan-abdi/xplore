import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_merchant_store/domain/repository/merchant_repository.dart';

import '../../../../core/domain/model/response_state.dart';
import '../model/product_model.dart';

class UpdateProduct {
  final repository = locator.get<MerchantRepository>();

  Future<void> call(
          {required ProductModel oldProduct,
          required ProductModel newProduct,
          required Function(ResponseState response) response}) async =>
      await repository.updateProduct(
          oldProduct: oldProduct, newProduct: newProduct, response: response);
}
