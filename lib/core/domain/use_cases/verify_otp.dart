import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

import '../model/response_state.dart';

class VerifyOtp {
  final repository = locator.get<AuthRepository>();

  Future<void> call(
          {required String verificationId,
          required String userOtp,
          required Function(ResponseState response) response,
          required Function(User user) onSuccess}) async =>
      await repository.verifyOtp(
          verificationId: verificationId,
          userOtp: userOtp,
          response: response,
          onSuccess: onSuccess);
}
