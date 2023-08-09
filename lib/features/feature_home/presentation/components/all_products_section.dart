import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';
import 'package:shamiri/features/feature_home/presentation/components/product_card.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_home/presentation/screens/product_view_page.dart';

import '../../../../core/presentation/components/my_lottie.dart';
import '../../../feature_merchant_store/domain/model/product_model.dart';

class AllProductsSection extends StatefulWidget {
  const AllProductsSection({super.key});

  @override
  State<AllProductsSection> createState() => _AllProductsSectionState();
}

class _AllProductsSectionState extends State<AllProductsSection> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();

    _homeController.getAllProducts().listen((snapshot) {
      var products = snapshot.docs
          .map((product) =>
              ProductModel.fromJson(product.data() as Map<String, dynamic>))
          .toList();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _homeController.setProducts(products: products);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_homeController.products.isEmpty) {
        return SliverFillRemaining(
          child: Center(child: Text('No products yet')),
        );
      } else {
        final filteredProducts =
            _homeController.activeCategory.value.categoryName == 'All'
                ? _homeController.products
                : _homeController.products
                    .where((product) =>
                        product.productCategoryId ==
                        _homeController.activeCategory.value.categoryName)
                    .toList();

        if (filteredProducts.isEmpty) {
          return SliverFillRemaining(
            child: Center(child: Text('No products in ${_homeController.activeCategory.value.categoryName}')),
          );
        } else {
          return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                      (context, index) => ProductCard(
                    product: filteredProducts[index],
                    onTap: () => Get.to(() =>
                        ProductViewPage(product: filteredProducts[index])),
                  ),
                  childCount: filteredProducts.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 180,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 12));
        }
      }
    });
  }
}
