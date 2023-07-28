abstract class AuthRepository {

  /// Sign In with phone
  Future<void> signInWithPhone({required String phoneNumber, required Function(String verificationId) onCodeSent});
}