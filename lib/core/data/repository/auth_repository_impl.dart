import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/core/utils/constants.dart';

import '../../../di/locator.dart';
import '../../domain/model/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final auth = locator.get<FirebaseAuth>();
  final firestore = locator.get<FirebaseFirestore>();
  final storage = locator.get<FirebaseStorage>();

  @override
  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Function(String verificationId) onCodeSent}) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
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

  @override
  Future<void> verifyOtp(
      {required String verificationId,
      required String userOtp,
      required Function(User user) onSuccess}) async {
    try {
      //  get login credentials
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);

      final User? user = (await auth.signInWithCredential(credential)).user!;

      if (user != null) {
        onSuccess(user);
      }
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<bool> checkUserExists({required String uid}) async {
    final DocumentSnapshot snapshot =
        await firestore.collection(Constants.USER_COLLECTION).doc(uid).get();

    return snapshot.exists ? true : false;
  }

  /// FIRESTORE
  @override
  Future<void> saveUserDataToFirestore(
      {required UserModel userModel,
      required File userProfilePic,
      required Function onSuccess}) {
    try {

      //  upload image to firebase storage
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String> storeFileToFirebaseStorage({required String ref, required File file}) async {
    // TODO: implement storeFileToFirebaseStorage
    throw UnimplementedError();
  }
}
