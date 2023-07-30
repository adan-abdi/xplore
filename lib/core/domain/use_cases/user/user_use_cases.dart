import 'package:shamiri/core/domain/use_cases/user/add_user_prefs.dart';
import 'package:shamiri/core/domain/use_cases/user/delete_user_prefs.dart';
import 'package:shamiri/core/domain/use_cases/user/get_user_prefs.dart';
import 'package:shamiri/core/domain/use_cases/user/update_user_prefs.dart';

class UserUseCases {
  final AddUserPrefs addUserPrefs;
  final DeleteUserPrefs deleteUserPrefs;
  final UpdateUserPrefs updateUserPrefs;
  final GetUserPrefs getUserPrefs;

  UserUseCases(
      {required this.addUserPrefs,
      required this.deleteUserPrefs,
      required this.updateUserPrefs,
      required this.getUserPrefs});
}
