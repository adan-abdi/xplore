// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Database {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final _collectionReference = _firestore.collection("inventory");

  static final _docRefInventory =
      _collectionReference.doc("inventoryInfo").collection("products");
  static final _docRefOrder =
      _collectionReference.doc("ordersInfo").collection("transactions");

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
