// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_db.dart';

class ProductRepository {
  static final _collectionReference =
      globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _productCollection =
      _collectionReference.doc(_currentUserID).collection("products");

  Stream<QuerySnapshot> getStream() {
    var sortedCollection = _productCollection.orderBy('name');
    return sortedCollection.snapshots();
  }

  Future<void> addProduct(Product product) {
    return _productCollection.add(product.toJson());
  }

  Future<void> updateProduct(Product product) async {
    var _updateProductDocRef = _productCollection.doc(product.productRefID);
    await _updateProductDocRef.update(product.toJson());
  }

  Future<void> deleteProduct(String? productRefID) async {
    await _productCollection.doc(productRefID).delete();
  }

  Future<void> searchProduct(String searchTerm) async {
    await _productCollection.where('name',
        isEqualTo: _setSearchParam(searchTerm));
  }

  _setSearchParam(String searchTerm) {
    List<String> nameSearchList = [];
    String temp = "";
    for (int i = 0; i < searchTerm.length; i++) {
      temp = temp + searchTerm[i];
      nameSearchList.add(temp);
    }
    return nameSearchList;
  }
}
