// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';
import 'package:shamiri/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/xplore_firestore.dart';

class ProductRepository {
  static final _collectionReference =
      globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _productCollection =
      _collectionReference.doc(_currentUserID).collection("products");

  Stream<QuerySnapshot> getProductStream() {
    var productCollectionStream = _productCollection.orderBy('name');

    return productCollectionStream.snapshots();
  }

  Stream<QuerySnapshot> getSearchStream(
      {required ProductListingStates? state, required String searchterm}) {
    Stream<QuerySnapshot> productCollectionStream;

    assert(state!.index == 4);

    productCollectionStream = _productCollection
        .where('name', isEqualTo: _setSearchParam(searchterm))
        .snapshots();

    return productCollectionStream;
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