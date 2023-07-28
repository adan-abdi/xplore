import 'package:shamiri/core/domain/use_cases/sign_in_with_phone.dart';
import 'package:shamiri/core/domain/use_cases/verify_otp.dart';

class AuthUseCases {
  final SignInWithPhone signInWithPhone;
  final VerifyOtp verifyOtp;

  AuthUseCases({required this.signInWithPhone, required this.verifyOtp});
}
