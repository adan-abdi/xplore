import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shamiri/core/domain/model/response_state.dart';

import '../model/user_model.dart';

abstract class AuthRepository {
  /// Sign In with phone
  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Function(ResponseState response, String? error) response,
      required Function(String verificationId) onCodeSent});

  /// Sign Out
  Future<void> signOut();

  /// Verify OTP
  Future<void> verifyOtp(
      {required String verificationId,
      required String userOtp,
      required Function(ResponseState response, String? error) response,
      required Function(User user) onSuccess});

  /// Check if User Exists
  Future<bool> checkUserExists({required String uid});

  /// Save User to Firestore
  Future<void> saveUserDataToFirestore(
      {required UserModel userModel,
      required File? userProfilePic,
      required Function(ResponseState response, String? error) response,
      required Function onSuccess});

  /// Get User Data From Firebase
  Stream<DocumentSnapshot> getUserDataFromFirestore();

  /// Get User Data From Firebase
  Future<UserModel> getSpecificUserFromFirestore({required String uid});

  /// Update User Data In Firestore
  Future<void> updateUserDataInFirestore(
      {required UserModel oldUser, required UserModel newUser, required String uid});

  Future<String> storeFileToFirebaseStorage(
      {required String ref, required File file});
}
