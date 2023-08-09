import 'package:shamiri/di/locator.dart';

import '../repository/merchant_repository.dart';

class DeleteProduct {
  final repository = locator.get<MerchantRepository>();

  Future<void> call({required String productId}) async =>
      await repository.deleteProduct(productId: productId);
}
