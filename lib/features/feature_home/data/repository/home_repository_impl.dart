import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shamiri/core/utils/constants.dart';
import 'package:shamiri/features/feature_home/domain/repository/home_repository.dart';

import '../../../../di/locator.dart';

class HomeRepositoryImpl implements HomeRepository {
  final firestore = locator.get<FirebaseFirestore>();

  @override
  Stream<QuerySnapshot<Object?>> getAllStores() =>
      firestore.collection(Constants.USER_COLLECTION).snapshots();

  @override
  Stream<QuerySnapshot<Object?>> getAllProducts({required String? filter}) {
    if (filter == null) {
      return firestore
          .collectionGroup(Constants.PRODUCTS_COLLECTION)
          .snapshots();
    } else {
      return firestore
          .collectionGroup(Constants.PRODUCTS_COLLECTION)
          .where('productCategoryId', isEqualTo: filter)
          .snapshots();
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getStoreProducts({required String userId}) =>
      firestore
          .collection(Constants.USER_COLLECTION)
          .doc(userId)
          .collection(Constants.PRODUCTS_COLLECTION)
          .snapshots();
}
