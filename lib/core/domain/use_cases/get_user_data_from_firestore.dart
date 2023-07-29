import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

import '../model/user_model.dart';

class GetUserDataFromFirestore {
  final repository = locator.get<AuthRepository>();

  Future<void> call({required Function(UserModel user) onSuccess}) async =>
      await repository.getUserDataFromFirestore(onSuccess: onSuccess);
}
