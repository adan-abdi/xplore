import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

import '../model/user_model.dart';

class GetSpecificUserFromFirestore {
  final repository = locator.get<AuthRepository>();

  Future<UserModel> call({required String uid}) async =>
      await repository.getSpecificUserFromFirestore(uid: uid);
}
