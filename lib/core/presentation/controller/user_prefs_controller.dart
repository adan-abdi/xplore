import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shamiri/core/domain/model/user_prefs.dart';
import 'package:shamiri/core/domain/use_cases/user/user_use_cases.dart';
import 'package:shamiri/core/utils/constants.dart';
import 'package:shamiri/di/locator.dart';

class UserPrefsController extends GetxController {

  final useCases = locator.get<UserUseCases>();

  /// User Prefs
  final userPrefs = Hive.box(Constants.USER_PREFS_BOX).listenable().obs;

  Future<void> addUserPrefs({required UserPrefs userPrefs}) async =>
      await useCases.addUserPrefs.call(userPrefs: userPrefs);

  Future<void> deleteUserPrefs() async => await useCases.deleteUserPrefs();

  Future<UserPrefs> getUserPrefs() async => await useCases.getUserPrefs();

  Future<void> updateUserPrefs({required UserPrefs userPrefs}) async =>
      await useCases.updateUserPrefs.call(userPrefs: userPrefs);
}