import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';

import '../../../di/locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  final auth = locator.get<FirebaseAuth>();

  @override
  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Function(String verificationId) onCodeSent}) async {
    try {
      await auth.verifyPhoneNumber(
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            //  when verification is complete, sign in
            await auth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            onCodeSent(verificationId);
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseException catch (error) {
      throw Exception(error.code);
    }
  }
}
