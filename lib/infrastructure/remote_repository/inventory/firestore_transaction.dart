// Project imports:
import 'package:shamiri/domain/models/transactions/transaction.dart';
import 'package:shamiri/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/xplore_firestore.dart';

class TransactionRepository {
  static final _collectionReference = globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _transactionCollection = _collectionReference.doc(_currentUserID).collection("transactions");

  dynamic getPendingOrdersStream() {
    var pendingOrders;

    pendingOrders = _transactionCollection.where('status', isEqualTo: 'pending').snapshots();

    pendingOrders = pendingOrders.map((snapshot) => snapshot.docs.map((e) => Order.fromJson(e.data())).toList());

    return pendingOrders;
  }

  dynamic getFulfilledOrdersStream() {
    var fulfilledOrders;

    fulfilledOrders = _transactionCollection.where('status', isEqualTo: 'fulfilled').snapshots();

    fulfilledOrders = fulfilledOrders.map((snapshot) => snapshot.docs.map((e) => Order.fromJson(e.data())).toList());

    return fulfilledOrders;
  }

  Future<void> recordTransaction(Order order) {
    return _transactionCollection.doc(order.transactionRefId).set(order.toJson());
  }

  Future<void> updateTransaction(Order order) async {
    var _updateTransactionDocRef = _transactionCollection.doc(order.transactionRefId);

    await _updateTransactionDocRef.update(order.toJson());
  }

  Future<void> deleteTransaction(String? transactionRefId) async {
    await _transactionCollection.doc(transactionRefId).delete();
  }

  Future<void> fulfillTransaction(String? transactionRefId) async {
    await _transactionCollection.doc(transactionRefId).update({'status': 'fulfilled'});
  }

  Future<void> updateTransactionQty({String? transactionRefId, String? newQTy}) async {
    await _transactionCollection.doc(transactionRefId).update({
      'quantityOrdered': newQTy,
    });
  }
}
