import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/domain/use_cases/auth_use_cases.dart';
import 'package:shamiri/di/locator.dart';

class AuthController extends GetxController {
  final authUseCases = locator.get<AuthUseCases>();

  final user = Rxn<User>();

  /// sign in with phone
  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Function(String verificationId) onCodeSent}) async {
    var formattedPhoneNumber = '+254${phoneNumber.trim()}';

    await authUseCases.signInWithPhone
        .call(phoneNumber: formattedPhoneNumber, onCodeSent: onCodeSent);
  }

  /// Verify Otp
  Future<void> verifyOtp(
      {required String verificationId,
      required String userOtp,
      required Function(User user) onSuccess}) async {
    await authUseCases.verifyOtp.call(
        verificationId: verificationId, userOtp: userOtp, onSuccess: onSuccess);
  }

  /// Check if user exists
  Future<bool> checkUserExists({required String uid}) async =>
      await authUseCases.checkUserExists.call(uid: uid);
}
