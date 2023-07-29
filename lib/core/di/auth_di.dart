import 'package:get_it/get_it.dart';
import 'package:shamiri/core/data/repository/auth_repository_impl.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/core/domain/use_cases/auth_use_cases.dart';
import 'package:shamiri/core/domain/use_cases/check_user_exists.dart';
import 'package:shamiri/core/domain/use_cases/sign_in_with_phone.dart';
import 'package:shamiri/core/domain/use_cases/verify_otp.dart';

void authDI({required GetIt locator}) {
  /// Auth Repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  /// Auth Use Cases
  locator.registerLazySingleton<AuthUseCases>(() => AuthUseCases(
      signInWithPhone: SignInWithPhone(),
      verifyOtp: VerifyOtp(),
      checkUserExists: CheckUserExists()));
}
