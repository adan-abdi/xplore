import 'package:shamiri/domain/models/users/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference collection = FirebaseFirestore.instance.collection('Users');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<void> addUser(ShamiriUser user) {
    return collection.doc(user.uid).set(user.toJson());
  }

  void updateUser(ShamiriUser user) async {
    await collection.doc(user.uid).update(user.toJson());
  }

  void deleteUser(ShamiriUser user) async {
    await collection.doc(user.uid).delete();
  }
}
