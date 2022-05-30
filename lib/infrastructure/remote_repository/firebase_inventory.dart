// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_db.dart';

class InventoryRepository {
  static final _collectionReference =
      globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _userInventoryRef = _collectionReference.doc(_currentUserID);

  Stream<DocumentSnapshot<Map<String, dynamic>>> getStream() {
    return _userInventoryRef.get().asStream();
  }
}
