import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

import '../model/user_model.dart';

class GetUserDataFromFirestore {
  final repository = locator.get<AuthRepository>();

  Stream<DocumentSnapshot> call() => repository.getUserDataFromFirestore();
}
