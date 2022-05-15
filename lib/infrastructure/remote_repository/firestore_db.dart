// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:shamiri/domain/models/users/user.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';

FirebaseFirestore globalFirestoreInstance = FirebaseFirestore.instance;

class XploreFirestore {
  Future<void> createRemoteUserEntity({
    required String uid,
    required String phoneNumber,
    String name = 'Merchant Store',
  }) async {
    final User? _user = globalFirebaseAuthInstance.currentUser;

    assert(_user != null);

    ShamiriUser newUser = ShamiriUser(
      name: name,
      uid: uid,
      phoneNumber: phoneNumber,
    );

    globalFirestoreInstance
        .collection("Users")
        .add({"key": 'Users', "newUser": newUser}).then((_) {
      if (kDebugMode) {
        print("User collection created");
      }
    }).catchError((_) {
      print("an error occurred");
    });
  }
}
