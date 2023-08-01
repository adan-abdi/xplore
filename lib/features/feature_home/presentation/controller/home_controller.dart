import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/home_use_cases.dart';

import '../../../feature_merchant_store/domain/model/product_model.dart';

class HomeController extends GetxController {
  final useCases = locator.get<HomeUseCases>();

  /// Active Bottom Bar Index
  final activeBottomBarIndex = 0.obs;

  /// Check Whether drawer is open
  final isDrawerOpen = false.obs;

  void setActiveBottomBarIndex(int index) => activeBottomBarIndex.value = index;

  void setIsDrawerOpen(bool isOpen) => isDrawerOpen.value = isOpen;

  /// All Products
  Stream<QuerySnapshot> getAllProducts() => useCases.getAllProducts();
}
