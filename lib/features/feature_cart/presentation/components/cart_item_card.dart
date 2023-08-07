import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../core/domain/model/user_model.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../../domain/value_objects/app_spaces.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';

class CartItemCard extends StatefulWidget {
  final ProductModel product;
  final int cartQuantity;

  const CartItemCard({super.key, required this.product, required this.cartQuantity});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {

  late final HomeController _homeController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();
  }

  void decrementCount() {
    var cartItem = _authController.user.value!.itemsInCart!.firstWhere(
            (item) => item.cartProductId == widget.product.productId!);

    var currentCartCount = cartItem.cartProductCount!;

    if (currentCartCount > 1) {
      currentCartCount -= 1;

      _authController
          .user
          .value!
          .itemsInCart![_authController.user.value!.itemsInCart!.indexWhere(
              (item) => item.cartProductId! == widget.product.productId!)]
          .cartProductCount = currentCartCount;

      //  update items in cart
      _authController.updateUserDataInFirestore(
          newUser: UserModel(
              itemsInCart: _authController.user.value!.itemsInCart!));
    }
  }

  void incrementCount() {
    var cartItem = _authController.user.value!.itemsInCart!.firstWhere(
            (item) => item.cartProductId == widget.product.productId!);

    var currentCartCount = cartItem.cartProductCount!;

    if (currentCartCount < widget.product.productStockCount!) {
      currentCartCount += 1;

      _authController
          .user
          .value!
          .itemsInCart![_authController.user.value!.itemsInCart!.indexWhere(
              (item) => item.cartProductId! == widget.product.productId!)]
          .cartProductCount = currentCartCount;

      //  update items in cart
      _authController.updateUserDataInFirestore(
          newUser: UserModel(
              itemsInCart: _authController.user.value!.itemsInCart!));
  }}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: XploreColors.white),
      child: Row(
        children: [
          //  image
          Container(
            width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: XploreColors.deepBlue
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: widget.product.productImageUrl != null &&
                    widget.product.productImageUrl!.isNotEmpty
                    ? Image.network(
                  widget.product.productImageUrl!,
                  fit: BoxFit.cover,
                )
                    : Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: XploreColors.white,
                  size: 32,
                ),
              )),

          hSize10SizedBox,

          //  description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.productName!,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_rounded,
                          color: XploreColors.xploreOrange,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ksh. ${widget.product.productSellingPrice!}'),

                    //  increment cart button
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => decrementCount(),
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: XploreColors.deepBlue,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.remove_rounded,
                                color: XploreColors.white,
                              ),
                            ),
                          ),
                        ),
                        hSize10SizedBox,
                        Text(
                          '${widget.cartQuantity}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        hSize10SizedBox,
                        GestureDetector(
                          onTap: () => incrementCount(),
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: XploreColors.deepBlue,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add_rounded,
                                color: XploreColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
