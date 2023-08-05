import 'package:shamiri/features/feature_home/domain/use_cases/get_all_products.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/get_all_stores.dart';

class HomeUseCases {
  final GetAllProducts getAllProducts;
  final GetAllStores getAllStores;

  HomeUseCases({required this.getAllProducts, required this.getAllStores});
}
