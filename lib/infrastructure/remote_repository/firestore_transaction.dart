// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/domain/models/transactions/transaction.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_db.dart';

class TransactionRepository {
  static final _collectionReference =
      globalFirestoreInstance.collection("inventory");
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _transactionCollection = _collectionReference
    ..doc(_currentUserID).collection("transactions");
  static final _transactionDocRef = _transactionCollection.doc();

  Stream<QuerySnapshot> getStream() {
    return _transactionCollection.snapshots();
  }

  Future<void> recordTransaction(Order order) {
    return _transactionDocRef.set(order.toJson());
  }

  Future<void> updateTransaction(Order order) async {
    var _updateTransactionDocRef =
        _transactionCollection.doc(order.transactionRefId);
    await _updateTransactionDocRef.update(order.toJson());
  }

  Future<void> deleteTransaction(String? transactionRefId) async {
    await _transactionCollection.doc(transactionRefId).delete();
  }
}
