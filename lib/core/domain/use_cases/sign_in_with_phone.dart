import 'package:flutter/cupertino.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';

import '../../../di/locator.dart';
import '../model/response_state.dart';

class SignInWithPhone {
  final repository = locator.get<AuthRepository>();

  Future<void> call(
          {required String phoneNumber,
          required Function(ResponseState response) response,
          required Function(String verificationId) onCodeSent}) async =>
      await repository.signInWithPhone(
          phoneNumber: phoneNumber,
          response: response,
          onCodeSent: onCodeSent);
}
