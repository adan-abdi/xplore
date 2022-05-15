// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:shamiri/domain/models/users/user.dart';

FirebaseAuth globalFirebaseAuthInstance = FirebaseAuth.instance;

class UserRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addUser(ShamiriUser user) {
    return collection.add(user.toJson());
  }

  void updateUser(ShamiriUser user) async {
    await collection.doc(user.uid).update(user.toJson());
  }

  void deleteUser(ShamiriUser user) async {
    await collection.doc(user.uid).delete();
  }
}

// FirebaseUser loggedInUser;
// final _firestore = Firestore.instance;
//
// double _latitude;
// double _longitude;

// void getCurrentLocation() async {
//   try {
//     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _latitude = position.latitude;
//       _longitude = position.longitude;
//     });
//     _firestore
//         .collection('users')
//         .document('${loggedInUser.uid}')
//         .updateData({'location': GeoPoint(_latitude, _longitude)});
//   } catch (e) {
//     print(e);
//   }
// }
