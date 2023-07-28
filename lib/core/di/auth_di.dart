import 'package:get_it/get_it.dart';
import 'package:shamiri/core/data/repository/auth_repository_impl.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';

void authDI({required GetIt locator}) {

  /// Auth Repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}