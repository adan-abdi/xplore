import 'package:get/get.dart';
import 'package:shamiri/core/domain/use_cases/auth_use_cases.dart';
import 'package:shamiri/di/locator.dart';

class AuthController extends GetxController {
  final authUseCases = locator.get<AuthUseCases>();

  /// sign in with phone
  Future<void> signInWithPhone(
          {required String phoneNumber,
          required Function(String verificationId) onCodeSent}) async =>
      await authUseCases.signInWithPhone
          .call(phoneNumber: phoneNumber, onCodeSent: onCodeSent);
}
