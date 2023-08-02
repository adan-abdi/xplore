

import 'package:shamiri/core/domain/model/user_prefs.dart';

import '../../../../di/locator.dart';
import '../../repository/user_repository.dart';

class GetUserPrefs {
  final repo = locator.get<UserRepository>();

  Future<UserPrefs> call() => repo.getUserPrefs();
}
