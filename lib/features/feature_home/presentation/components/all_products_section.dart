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
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _homeController.getAllProducts(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SliverToBoxAdapter(
                child: MyLottie(
              lottie: 'assets/general/loading.json',
              width: 50,
              height: 50,
            ));
          }

          if (!snapshot.hasData) {
            return SliverFillRemaining(child: Text("No Data found"));
          }

          var products = snapshot.data!.docs
              .map((product) =>
                  ProductModel.fromJson(product.data() as Map<String, dynamic>))
              .toList();

          return products.isEmpty
              ? SliverFillRemaining(
                  child: Center(child: Text('No products yet')),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ProductCard(
                            product: products[index],
                            onTap: () => Get.to(() =>
                                ProductViewPage(product: products[index])),
                          ),
                      childCount: products.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 12));
        });
  }
}
