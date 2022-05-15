// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/domain/models/category.dart';

class CategoryRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('categories');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addCategory(Category category) {
    return collection.add(category.toJson());
  }

  void updateCategory(Category category) async {
    await collection.doc(category.referenceId).update(category.toJson());
  }

  void deleteCategory(Category category) async {
    await collection.doc(category.referenceId).delete();
  }
}
