// Project imports:
import 'package:shamiri/domain/models/transactions/order.dart';
import 'package:shamiri/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/xplore_firestore.dart';

class ReceiptsRepository {
  static final _collectionReference =
      globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _transactionCollection =
      _collectionReference.doc(_currentUserID).collection("orders");

  dynamic getReceiptsStream() {
    var pendingOrders;

    pendingOrders = _transactionCollection
        .where('status', isEqualTo: 'fulfilled')
        .snapshots();

    pendingOrders = pendingOrders.map((snapshot) =>
        snapshot.docs.map((e) => Order.fromJson(e.data())).toList());

    return pendingOrders;
  }

  Future<void> updateReceiptRef(String ref) async {
    _transactionCollection.doc(ref).update({'transactionRefId': ref});
  }

  Future<void> updateReceipt(Order order) async {
    var _updateTransactionDocRef = _transactionCollection.doc(order.orderRefId);

    await _updateTransactionDocRef.update(order.toJson());
  }

  Future<void> deleteReceipt(String? transactionRefId) async {
    await _transactionCollection.doc(transactionRefId).delete();
  }
}
