import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  /// Sign In with phone
  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Function(String verificationId) onCodeSent});

  /// Verify OTP
  Future<void> verifyOtp(
      {required String verificationId,
      required String userOtp,
      required Function(User user) onSuccess});

  /// Check if User Exists
  Future<bool> checkUserExists({required String uid});
}
