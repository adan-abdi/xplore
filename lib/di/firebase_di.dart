import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

/// Firebase Dependencies
void firebaseDI({required GetIt locator}) {

  /// Firebase Auth
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}