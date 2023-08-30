import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/presentation/components/all_cart_products.dart';
import 'package:shamiri/features/feature_cart/presentation/components/checkout_card.dart';

import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';

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
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: XploreColors.white,
              systemNavigationBarColor:
                  _authController.user.value!.itemsInCart!.isEmpty
                      ? XploreColors.white
                      : XploreColors.deepBlue,
              systemNavigationBarIconBrightness: Brightness.dark),
          title: Text(
            "My Cart",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: XploreColors.black),
          ),
          centerTitle: true,
          backgroundColor: XploreColors.white,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon:
                  Icon(Icons.arrow_back_rounded, color: XploreColors.deepBlue)),
          elevation: 0,
        ),
        body: _authController.user.value!.itemsInCart!.isNotEmpty
            ? SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    //  All Products
                    AllCartProducts(),

                    //  checkout container
                    Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Obx(
                          () => CheckoutCard(
                            itemsInCart:
                                _authController.user.value!.itemsInCart!,
                            products: _homeController.products,
                          ),
                        )),
                  ],
                ),
              )
            : SafeArea(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyLottie(lottie: 'assets/general/cart2.json'),
                      vSize30SizedBox,
                      Text(
                        "No items in your cart... Happy shopping!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
