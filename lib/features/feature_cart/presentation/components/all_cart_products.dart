import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/features/feature_cart/presentation/components/cart_item_card.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';

import '../../../../application/core/themes/colors.dart';
import 'package:get/get.dart';

class AllCartProducts extends StatefulWidget {
  const AllCartProducts({super.key});

  @override
  State<AllCartProducts> createState() => _AllCartProductsState();
}

class _AllCartProductsState extends State<AllCartProducts> {
  late final AuthController _authController;
  late final MerchantController _merchantController;

  @override
  void initState() {
    super.initState();

    _authController = Get.find();
    _merchantController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: XploreColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //  All Cart Products
          Obx(
            () {
              final allProducts = _merchantController.merchantProducts;

              return allProducts.isNotEmpty && _authController
                  .user
                  .value!
                  .itemsInCart!.isNotEmpty
                  ? SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => Obx(
                                    () => CartItemCard(
                                      index: index,
                                      product: _merchantController.merchantProducts
                                          .firstWhere((product) =>
                                              product.productId ==
                                              _authController
                                                  .user
                                                  .value!
                                                  .itemsInCart![index]
                                                  .cartProductId),
                                      cartQuantity: _authController
                                          .user
                                          .value!
                                          .itemsInCart![index]
                                          .cartProductCount!,
                                    ),
                                  ),
                              childCount: _authController
                                  .user.value!.itemsInCart!.length)),
                    )
                  : SliverToBoxAdapter(
                    child: Center(
                        child: Text("No items in cart"),
                      ),
                  );
            },
          ),

          SliverToBoxAdapter(
              child: SizedBox(
            height: 250,
          ))
        ],
      ),
    );
  }
}
