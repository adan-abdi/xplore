import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';
import 'package:shamiri/features/feature_home/presentation/components/product_card.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';

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
            return SliverFillRemaining(
                child: MyLottie(lottie: 'assets/general/loading.json', width: 50, height: 50,));
          }

          if (!snapshot.hasData) {
            return SliverFillRemaining(child: Text("No Data found"));
          }

          var products = snapshot.data!.docs
              .map((product) =>
                  ProductModel.fromMap(product.data() as Map<String, dynamic>))
              .toList();

          return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      ProductCard(product: products[index]),
                  childCount: products.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 12));
        });
  }
}
