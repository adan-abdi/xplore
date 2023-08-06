import 'package:shamiri/core/domain/use_cases/get_user_data_from_firestore.dart';
import 'package:shamiri/core/domain/use_cases/save_user_data_to_firestore.dart';
import 'package:shamiri/core/domain/use_cases/sign_in_with_phone.dart';
import 'package:shamiri/core/domain/use_cases/sign_out.dart';
import 'package:shamiri/core/domain/use_cases/update_user_data_in_firestore.dart';
import 'package:shamiri/core/domain/use_cases/verify_otp.dart';

import 'check_user_exists.dart';

class AuthUseCases {
  final SignInWithPhone signInWithPhone;
  final SignOut signOut;
  final VerifyOtp verifyOtp;
  final CheckUserExists checkUserExists;
  final SaveUserDataToFirestore saveUserDataToFirestore;
  final GetUserDataFromFirestore getUserDataFromFirestore;
  final UpdateUserDataInFirestore updateUserDataInFirestore;

  AuthUseCases(
      {required this.signInWithPhone,
      required this.signOut,
      required this.verifyOtp,
      required this.checkUserExists,
      required this.saveUserDataToFirestore,
      required this.getUserDataFromFirestore,
      required this.updateUserDataInFirestore});
}
