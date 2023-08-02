import '../../../../di/locator.dart';
import '../../repository/user_repository.dart';

class DeleteUserPrefs {
  final repo = locator.get<UserRepository>();

  Future<void> call() => repo.deleteUserPrefs();
}
