import 'package:shamiri/core/domain/model/user_prefs.dart';

import '../../../../di/locator.dart';
import '../../repository/user_repository.dart';

class AddUserPrefs {
  final repo = locator.get<UserRepository>();

  Future<void> call({required UserPrefs userPrefs}) =>
      repo.addUserPrefs(userPrefs: userPrefs);
}
