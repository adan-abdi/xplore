import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamiri/core/domain/model/response_state.dart';

import '../model/user_model.dart';

abstract class AuthRepository {
  /// Sign In with phone
  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Function(ResponseState response) response,
      required Function(String verificationId) onCodeSent});

  /// Verify OTP
  Future<void> verifyOtp(
      {required String verificationId,
      required String userOtp,
      required Function(User user) onSuccess});

  /// Check if User Exists
  Future<bool> checkUserExists({required String uid});

  /// Save User to Firestore
  Future<void> saveUserDataToFirestore(
      {required UserModel userModel,
      required File? userProfilePic,
      required Function onSuccess});

  /// Get User Data From Firebase
  Future<void> getUserDataFromFirestore(
      {required Function(UserModel user) onSuccess});

  Future<String> storeFileToFirebaseStorage(
      {required String ref, required File file});
}
