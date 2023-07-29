import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

/// Firebase Dependencies
void firebaseDI({required GetIt locator}) {
  /// Firebase Auth
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  /// Firebase Firestore
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  /// Firebase Storage
  locator.registerLazySingleton<FirebaseStorage>(
          () => FirebaseStorage.instance);
}
