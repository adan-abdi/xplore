import 'package:shamiri/domain/models/users/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_db.dart';

class UserRepository {
  static final _collection = globalFirestoreInstance.collection('Users');
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _userCollectionRef = _collection.doc(_currentUserID);

  Stream<QuerySnapshot> getStream() {
    return _collection.snapshots();
  }

  Future<void> addUser(ShamiriUser user) {
    return _userCollectionRef.set(user.toJson());
  }

  void updateUser(ShamiriUser user) async {
    await _userCollectionRef.update(user.toJson());
  }

  void deleteUser(ShamiriUser user) async {
    await _userCollectionRef.delete();
  }
}