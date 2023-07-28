import 'package:shamiri/core/domain/repository/auth_repository.dart';

import '../../../di/locator.dart';

class SignInWithPhone {
  final repository = locator.get<AuthRepository>();

  Future<void> call(
          {required String phoneNumber,
          required Function(String verificationId) onCodeSent}) async =>
      await repository.signInWithPhone(
          phoneNumber: phoneNumber, onCodeSent: onCodeSent);
}
