// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamiri/domain/models/shamiri_user.dart';

// Project imports:
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';

FirebaseFirestore globalFirestoreInstance = FirebaseFirestore.instance;

class XploreFirestore {
  Future<void> createRemoteUserEntity() async {
    final User? _user = globalFirebaseAuthInstance.currentUser;

    assert(_user != null);

    ShamiriUser newUser = ShamiriUser(_user!.uid, _user.phoneNumber);

    globalFirestoreInstance.collection("Users").add({"key": 'Users', "newUser": newUser}).then((_) {
      if (kDebugMode) {
        print("User collection created");
      }
    }).catchError((_) {
      print("an error occurred");
    });
  }
}
