import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/domain/use_cases/auth_use_cases.dart';
import 'package:shamiri/di/locator.dart';

import '../../domain/model/user_model.dart';

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

  /// Save User Data to Firestore
  Future<void> saveUserDataToFirestore(
          {required UserModel userModel,
          required File? userProfilePic,
          required Function onSuccess}) async =>
      await authUseCases.saveUserDataToFirestore.call(
          userModel: userModel,
          userProfilePic: userProfilePic,
          onSuccess: onSuccess);

  /// Get User Data from Firestore
  Future<void> getUserDataFromFirestore(
          {required Function(UserModel user) onSuccess}) async =>
      await authUseCases.getUserDataFromFirestore.call(onSuccess: onSuccess);
}
