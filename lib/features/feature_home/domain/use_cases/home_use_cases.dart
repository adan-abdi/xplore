import 'package:shamiri/features/feature_home/domain/use_cases/get_all_products.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/get_all_stores.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/get_store_products.dart';

class HomeUseCases {
  final GetAllProducts getAllProducts;
  final GetAllStores getAllStores;
  final GetStoreProducts getStoreProducts;

  HomeUseCases(
      {required this.getAllProducts,
      required this.getAllStores,
      required this.getStoreProducts});
}
