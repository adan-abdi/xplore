import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/presentation/components/all_cart_products.dart';
import 'package:shamiri/features/feature_cart/presentation/components/checkout_card.dart';

import '../../../core/presentation/controller/auth_controller.dart';
import '../../feature_home/presentation/controller/home_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final AuthController _authController;
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _authController = Get.find();
    _homeController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: XploreColors.white,
        body: _authController.user.value!.itemsInCart!.isNotEmpty
            ? Stack(
                fit: StackFit.expand,
                children: [
                  //  All Products
                  AllCartProducts(),

                  //  checkout container
                  Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: CheckoutCard()),
                ],
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyLottie(
                      lottie: 'assets/general/cart2.json'
                    ),
                    vSize30SizedBox,
                    Text("No items in your cart... Happy shopping!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                  ],
                ),
              ),
      ),
    );
  }
}
