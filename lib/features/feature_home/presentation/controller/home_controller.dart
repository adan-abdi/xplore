import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/presentation/model/product_category.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_home/domain/use_cases/home_use_cases.dart';

import '../../../../core/utils/constants.dart';
import '../../../feature_merchant_store/domain/model/product_model.dart';

class HomeController extends GetxController {
  final useCases = locator.get<HomeUseCases>();

  final products = <ProductModel>[].obs;
  final filteredProducts = <ProductModel>[].obs;
  final storeProducts = <ProductModel>[].obs;

  /// Active Bottom Bar Index
  final activeBottomBarIndex = 0.obs;

  /// Active Carousel Index
  final activeCarouselIndex = 0.obs;

  /// Active Category
  final activeCategory = Constants.productCategories[0].obs;

  /// Check Whether drawer is open
  final isDrawerOpen = false.obs;

  void setProducts({required List<ProductModel> products}) =>
      this.products.value = products;

  void setActiveBottomBarIndex(int index) => activeBottomBarIndex.value = index;

  void setActiveCarouselIndex(int index) => activeCarouselIndex.value = index;

  void setActiveCategory(ProductCategory category) =>
      activeCategory.value = category;

  void setIsDrawerOpen(bool isOpen) => isDrawerOpen.value = isOpen;

  void searchForProducts({required String query}) {
    filteredProducts.value = query.isEmpty
        ? []
        : products
            .where((product) => product.productName!
                .replaceAll(RegExp('[^A-Za-z]'), '')
                .replaceAll(" ", '')
                .toLowerCase()
                .contains(query.replaceAll(" ", '').toLowerCase()))
            .toList();
  }

  void filterProductsByStore({required String sellerId}) {
    storeProducts.value =
        products.where((product) => product.sellerId! == sellerId).toList();
  }

  /// All Stores
  Stream<QuerySnapshot> getAllStores() => useCases.getAllStores();

  /// All Products
  Stream<QuerySnapshot> getAllProducts() => useCases.getAllProducts();

  /// Store Products
  Stream<QuerySnapshot> getStoreProducts({required String userId}) =>
      useCases.getStoreProducts.call(userId: userId);
}
