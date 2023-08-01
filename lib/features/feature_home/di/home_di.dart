import 'package:get_it/get_it.dart';
import 'package:shamiri/features/feature_home/data/repository/home_repository_impl.dart';
import 'package:shamiri/features/feature_home/domain/repository/home_repository.dart';

void homeDI({required GetIt locator}) {
  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
}
