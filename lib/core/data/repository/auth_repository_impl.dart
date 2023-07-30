import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/core/utils/constants.dart';

import '../../../di/locator.dart';
import '../../domain/model/response_state.dart';
import '../../domain/model/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final auth = locator.get<FirebaseAuth>();
  final firestore = locator.get<FirebaseFirestore>();
  final storage = locator.get<FirebaseStorage>();

  @override
  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Function(ResponseState response) response,
      required Function(String verificationId) onCodeSent}) async {
    try {

      response(ResponseState.loading);

      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            //  when verification is complete, sign in
            await auth.signInWithCredential(phoneAuthCredential);
            response(ResponseState.success);
          },
          verificationFailed: (error) {
            response(ResponseState.failure);
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            response(ResponseState.success);
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
  Future<void> getUserDataFromFirestore(
      {required Function(UserModel user) onSuccess}) async {
    try {
      final uid = auth.currentUser!.uid;

      await firestore
          .collection(Constants.USER_COLLECTION)
          .doc(uid)
          .get()
          .then((document) {
        final data = document.data();

        if (data != null) {
          onSuccess(UserModel.fromMap(data));
        } else {
          print("NO DATA FOUND!!");
        }
      });
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> saveUserDataToFirestore(
      {required UserModel userModel,
      required File? userProfilePic,
      required Function onSuccess}) async {
    try {
      //  upload image to firebase storage
      if (userProfilePic != null) {
        await storeFileToFirebaseStorage(
                ref: 'profilePics/${auth.currentUser!.uid}',
                file: userProfilePic)
            .then((downloadUrl) {
          userModel.userProfilePicUrl = downloadUrl;
          userModel.createdAt = DateTime.now().toString();
          userModel.userPhoneNumber = auth.currentUser!.phoneNumber;
          userModel.userId = auth.currentUser!.uid;
        });
      } else {
        userModel.createdAt = DateTime.now().toString();
        userModel.userPhoneNumber = auth.currentUser!.phoneNumber;
        userModel.userId = auth.currentUser!.uid;
      }

      await firestore
          .collection(Constants.USER_COLLECTION)
          .doc(auth.currentUser!.uid)
          .set(userModel.toMap())
          .then((value) => onSuccess());
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String> storeFileToFirebaseStorage(
      {required String ref, required File file}) async {
    final UploadTask uploadTask = storage.ref().child(ref).putFile(file);
    final TaskSnapshot taskSnapshot = await uploadTask;

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
