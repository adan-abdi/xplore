// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/domain/models/categories/category.dart';
import 'package:shamiri/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/xplore_firestore.dart';

class CategoryRepository {
  static final _collectionReference =
      globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _categoryCollection = _collectionReference
    ..doc(_currentUserID).collection("categories");
  static final _categoryDocRef = _categoryCollection.doc();

  Stream<QuerySnapshot> getStream() {
    return _categoryCollection.snapshots();
  }

  Future<void> addCategory(Category category) {
    return _categoryDocRef.set(category.toJson());
  }

  void updateCategory(Category category) async {
    var _updateCategoryDocRef = _categoryCollection.doc(category.categoryRefId);
    await _updateCategoryDocRef.update(category.toJson());
  }

  void deleteCategory(Category category) async {
    await _categoryDocRef.delete();
  }
}
