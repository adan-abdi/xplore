import 'package:get_it/get_it.dart';
import 'package:shamiri/features/feature_home/data/repository/home_repository_impl.dart';
import 'package:shamiri/features/feature_home/domain/repository/home_repository.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/get_all_products.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/get_all_stores.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/get_store_products.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/home_use_cases.dart';

void homeDI({required GetIt locator}) {
  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

  locator.registerLazySingleton<HomeUseCases>(() => HomeUseCases(
      getAllProducts: GetAllProducts(),
      getAllStores: GetAllStores(),
      getStoreProducts: GetStoreProducts()));
}
