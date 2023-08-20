import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/presentation/components/show_alert_dialog.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../core/domain/model/cart_model.dart';
import '../../../../core/domain/model/user_model.dart';
import '../../../../core/presentation/components/show_toast.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../../domain/value_objects/app_spaces.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';

class CartItemCard extends StatefulWidget {
  final ProductModel product;
  final int cartQuantity;

  const CartItemCard(
      {super.key, required this.product, required this.cartQuantity});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  late final HomeController _homeController;
  late final AuthController _authController;
  late final FToast _toast;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();

    _toast = FToast();
    _toast.init(context);
  }

  void decrementCount() {
    var cartItem = _authController.user.value!.itemsInCart!
        .firstWhere((item) => item.cartProductId == widget.product.productId!);

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
          oldUser: _authController.user.value!,
          newUser:
              UserModel(itemsInCart: _authController.user.value!.itemsInCart!),
          uid: _authController.user.value!.userId!,
      response: (state, error){});
    } else {
      showAlertDialog(
          title: "Remove from cart",
          iconData: Icons.shopping_cart_rounded,
          content: Text("Would you like to remove this item from cart?"),
          onCancel: () => Get.back(),
          onConfirm: () async {
            //  get initial cart items
            final List<CartModel> itemsInCart =
            _authController.user.value!.itemsInCart!;
            //  remove item from list
            itemsInCart.removeWhere((item) =>
            item.cartProductId! == widget.product.productId!);

            //  update items in cart
            await _authController.updateUserDataInFirestore(
                oldUser: _authController.user.value!,
                newUser: UserModel(itemsInCart: itemsInCart),
                uid: _authController.user.value!.userId!,
                response: (state, error){});

            Get.back();
          });
    }
  }

  void incrementCount() {
    var cartItem = _authController.user.value!.itemsInCart!
        .firstWhere((item) => item.cartProductId == widget.product.productId!);

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
          oldUser: _authController.user.value!,
          newUser:
              UserModel(itemsInCart: _authController.user.value!.itemsInCart!),
          uid: _authController.user.value!.userId!,
          response: (state, error){});
    } else {
      showToast(
          toast: _toast,
          iconData: Icons.store_rounded,
          msg: "Reached max products in store");
    }
  }

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
                  color: XploreColors.deepBlue),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: widget.product.productImageUrls != null &&
                        widget.product.productImageUrls!.isNotEmpty
                    ? Image.network(
                        widget.product.productImageUrls![0],
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
                    Expanded(
                      child: Text(
                        widget.product.productName!,
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Ksh. ${widget.product.productSellingPrice!.toString().addCommas}'),

                    //  delete icon
                    IconButton(
                        onPressed: () async {
                          //  get initial cart items
                          final List<CartModel> itemsInCart =
                              _authController.user.value!.itemsInCart!;
                          //  remove item from list
                          itemsInCart.removeWhere((item) =>
                              item.cartProductId! == widget.product.productId!);

                          //  update items in cart
                          await _authController.updateUserDataInFirestore(
                              oldUser: _authController.user.value!,
                              newUser: UserModel(itemsInCart: itemsInCart),
                              uid: _authController.user.value!.userId!,
                              response: (state, error){});
                        },
                        icon: Icon(
                          Icons.delete_rounded,
                          color: XploreColors.xploreOrange,
                        ))
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
