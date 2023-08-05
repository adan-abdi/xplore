import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_home/domain/repository/home_repository.dart';

class GetAllStores {

  final repository = locator.get<HomeRepository>();

  Stream<QuerySnapshot> call() => repository.getAllStores();
}