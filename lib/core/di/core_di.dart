import 'package:get_it/get_it.dart';
import 'package:shamiri/core/data/repository/auth_repository_impl.dart';
import 'package:shamiri/core/data/repository/core_repository_impl.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/core/domain/repository/core_repository.dart';
import 'package:shamiri/core/domain/use_cases/auth_use_cases.dart';
import 'package:shamiri/core/domain/use_cases/check_user_exists.dart';
import 'package:shamiri/core/domain/use_cases/core/core_use_cases.dart';
import 'package:shamiri/core/domain/use_cases/core/get_package_details.dart';
import 'package:shamiri/core/domain/use_cases/core/pick_image.dart';
import 'package:shamiri/core/domain/use_cases/core/pick_multi_images.dart';
import 'package:shamiri/core/domain/use_cases/sign_in_with_phone.dart';
import 'package:shamiri/core/domain/use_cases/verify_otp.dart';

void coreDI({required GetIt locator}) {
  /// Auth Repository
  locator.registerLazySingleton<CoreRepository>(() => CoreRepositoryImpl());

  /// Auth Use Cases
  locator.registerLazySingleton<CoreUseCases>(() => CoreUseCases(
      pickImage: PickImage(),
      pickMultiImages: PickMultiImages(),
      getPackageDetails: GetPackageDetails()));
}
