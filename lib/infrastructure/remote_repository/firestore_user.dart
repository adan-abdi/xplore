// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/domain/models/product.dart';
import 'package:shamiri/domain/models/user.dart';

class UserRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addUser(User user) {
    return collection.add(user.toJson());
  }

  void updateUser(User user) async {
    await collection.doc(user.referenceId).update(user.toJson());
  }

  void deletePet(User user) async {
    await collection.doc(user.referenceId).delete();
  }
}
