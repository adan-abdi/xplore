import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/model/user_prefs.dart';
import '../../domain/repository/user_repository.dart';
import '../../utils/constants.dart';

class UserRepositoryImpl implements UserRepository {
  final Box userBox = Hive.box(Constants.USER_PREFS_BOX);

  @override
  Future<void> addUserPrefs({required UserPrefs userPrefs}) async =>
      await userBox.put('userPrefs', userPrefs);

  @override
  Future<void> deleteUserPrefs() async => await userBox.delete('userPrefs');

  @override
  Future<UserPrefs> getUserPrefs() async =>
      await userBox.get('userPrefs') as UserPrefs;

  @override
  Future<void> updateUserPrefs({required UserPrefs userPrefs}) async {
    var oldUser = await userBox.get('userPrefs') as UserPrefs;
    var newUser =
        UserPrefs(isLoggedIn: userPrefs.isLoggedIn ?? oldUser.isLoggedIn);

    await userBox.put('userPrefs', newUser);
  }
}
