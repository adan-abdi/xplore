import 'dart:io';

import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

import '../model/user_model.dart';

class SaveUserDataToFirestore {
  final repository = locator.get<AuthRepository>();

  Future<void> call(
          {required UserModel userModel,
          required File? userProfilePic,
          required Function onSuccess}) async =>
      await repository.saveUserDataToFirestore(
          userModel: userModel,
          userProfilePic: userProfilePic,
          onSuccess: onSuccess);
}
