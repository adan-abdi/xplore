import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_merchant_store/domain/repository/merchant_repository.dart';

class GetMerchantProducts {

  final repository = locator.get<MerchantRepository>();

  Stream<QuerySnapshot> call() => repository.getMerchantProducts();
}