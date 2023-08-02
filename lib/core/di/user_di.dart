import 'package:get_it/get_it.dart';
import 'package:shamiri/core/data/repository/user_repository_impl.dart';
import 'package:shamiri/core/domain/use_cases/user/add_user_prefs.dart';
import 'package:shamiri/core/domain/use_cases/user/delete_user_prefs.dart';
import 'package:shamiri/core/domain/use_cases/user/get_user_prefs.dart';
import 'package:shamiri/core/domain/use_cases/user/update_user_prefs.dart';
import 'package:shamiri/core/domain/use_cases/user/user_use_cases.dart';

import '../domain/repository/user_repository.dart';

void userDI({required GetIt locator}) {
  /// User Prefs Repository
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  /// User Prefs Use Cases
  locator.registerLazySingleton<UserUseCases>(() => UserUseCases(
      addUserPrefs: AddUserPrefs(),
      deleteUserPrefs: DeleteUserPrefs(),
      updateUserPrefs: UpdateUserPrefs(),
      getUserPrefs: GetUserPrefs()));
}
