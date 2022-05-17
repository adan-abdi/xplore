// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shamiri/domain/models/users/user.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_user.dart';

class Database {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final _collectionReference = _firestore.collection("inventory");

  static final _docRefInventory = _collectionReference.doc("inventoryInfo").collection("products");
  static final _docRefOrder = _collectionReference.doc("ordersInfo").collection("transactions");

  static Future<void> addProduct({
    required String name,
    required String bp,
    required String sp,
    required String units,
    required String quantity,
    required String category,
    required String image,
  }) async {
    DocumentReference documentReferencer = _docRefInventory.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "buying_price": bp,
      "selling_price": sp,
      "units": units,
      "quantity": quantity,
      "category": category,
      "image": image,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Product added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String name,
    required String bp,
    required String sp,
    required String units,
    required String quantity,
    required String category,
    required String docId,
    required String image,
  }) async {
    DocumentReference documentReferencer = _docRefInventory.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "buying_price": bp,
      "selling_price": sp,
      "units": units,
      "quantity": quantity,
      "category": category,
      "image": image,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Product updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> checkoutItem({
    required String name,
    required String bp,
    required String sp,
    required String units,
    required String quantity,
    required String category,
    required String rem,
    required String docId,
    required String image,
    required String status,
  }) async {
    DocumentReference documentReferencer = _docRefInventory.doc(docId);

    DocumentReference orderReferencer = _docRefOrder.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "buying_price": bp,
      "selling_price": sp,
      "units": units,
      "quantity": rem,
      "category": category,
      "image": image,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Product updated in the database"))
        .catchError((e) => print(e));

    int total = int.parse(sp) * int.parse(quantity);

    var now = DateTime.now();
    final format = DateFormat('yyyy-MM-dd HH:mm');
    var date = format.format(now);

    Map<String, dynamic> item = <String, dynamic>{
      "name": name,
      "price": sp,
      "units": units,
      "quantity": quantity,
      "category": category,
      "total": total.toString(),
      "date": date,
      "id": docId,
      "image": image,
      "status": status,
    };

    await orderReferencer
        .set(item)
        .whenComplete(() => print("Product updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readProducts() {
    CollectionReference notesItemCollection = _docRefInventory;

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readTransactions() {
    CollectionReference notesItemCollection = _docRefOrder;

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteProduct(String id) async {
    await _docRefInventory.doc(id).delete();
  }

  static Future<void> deleteTransaction(String id) async {
    await _docRefOrder.doc(id).delete();
  }
}

FirebaseFirestore globalFirestoreInstance = FirebaseFirestore.instance;

class XploreFirestore {
  Future<void> createOrUpdateRemoteUserEntity({
    required String? uid,
    required String? phoneNumber,
    String name = 'Merchant Store',
  }) async {
    final User? _user = globalFirebaseAuthInstance.currentUser;

    var remoteUserRepoInstance = UserRepository();

    assert(_user != null);

    ShamiriUser newUser = ShamiriUser(
      name: name,
      uid: uid,
      phoneNumber: phoneNumber,
    );

    remoteUserRepoInstance.addUser(newUser).then((value) {
      if (kDebugMode) {
        print("User collection created");
      }
    }).catchError((_) {
      print("an error occurred");
    });
  }
}
