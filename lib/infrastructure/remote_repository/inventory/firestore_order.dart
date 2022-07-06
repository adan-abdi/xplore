// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamiri/domain/models/transactions/order.dart';

// Project imports:
import 'package:shamiri/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/xplore_firestore.dart';

class TransactionRepository {
  static final _collectionReference = globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _orderCollection = _collectionReference.doc(_currentUserID).collection("orders");

  dynamic getOrderStream() {
    var pendingOrders;

    pendingOrders = _orderCollection.where('status', isEqualTo: 'pending').snapshots();

    pendingOrders = pendingOrders.map((snapshot) => snapshot.docs.map((e) => Order.fromJson(e.data())).toList());

    return pendingOrders;
  }

  Future<DocumentReference<Map<String, dynamic>>> recordOrder(Order order) {
    return _orderCollection.add(order.toJson());
  }

  Future<void> updateOrderRef(String ref) async {
    _orderCollection.doc(ref).update({'orderRefId': ref});
  }

  Future<void> updateorder(Order order) async {
    var _updateorderDocRef = _orderCollection.doc(order.orderRefId);

    await _updateorderDocRef.update(order.toJson());
  }

  Future<void> deleteorder(String? orderRefId) async {
    await _orderCollection.doc(orderRefId).delete();
  }

  Future<void> fulfillOrder(String? orderRefId) async {
    await _orderCollection.doc(orderRefId).update({'status': 'fulfilled'});
  }

  Future<void> updateorderQty({String? orderRefId, String? newQTy}) async {
    await _orderCollection.doc(orderRefId).update({
      'quantityOrdered': newQTy,
    });
  }
}
