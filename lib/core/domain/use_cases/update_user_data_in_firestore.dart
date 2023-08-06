import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

import '../model/user_model.dart';

class UpdateUserDataInFirestore {
  final repository = locator.get<AuthRepository>();

  Future<void> call(
          {required UserModel oldUser, required UserModel newUser}) async =>
      await repository.updateUserDataInFirestore(
          oldUser: oldUser, newUser: newUser);
}
