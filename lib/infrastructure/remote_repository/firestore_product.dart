// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_db.dart';

class ProductRepository {
  static final _collectionReference = globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _productCollection = _collectionReference..doc(_currentUserID).collection("products");
  static final _productDocRef = _productCollection.doc();

  Stream<QuerySnapshot> getStream() {
    return _productCollection.snapshots();
  }

  Future<void> addProduct(Product product) {
    return _productDocRef.set(product.toJson());
  }

  Future<void> updateProduct(Product product) async {
    var _updateProductDocRef = _productCollection.doc(product.productRefID);
    await _updateProductDocRef.update(product.toJson());
  }

  Future<void> deleteProduct(String? productRefID) async {
    await _productCollection.doc(productRefID).delete();
  }
}
