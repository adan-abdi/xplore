abstract class AuthRepository {

  /// Sign In with phone
  void signInWithPhone({required String phoneNumber, required Function(String verificationId) onCodeSent});
}