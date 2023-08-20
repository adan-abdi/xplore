import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/utils/constants.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../core/domain/model/cart_model.dart';
import '../../../../core/domain/model/user_model.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../../domain/value_objects/app_spaces.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';
import '../../../feature_onboarding/presentation/components/round_toggle_button.dart';

class ProductActionsBottomSheet extends StatefulWidget {
  final ProductModel product;

  const ProductActionsBottomSheet({super.key, required this.product});

  @override
  State<ProductActionsBottomSheet> createState() => _ProductActionsBottomSheetState();
}

class _ProductActionsBottomSheetState extends State<ProductActionsBottomSheet> {

  int itemCount = 1;

  late final HomeController _homeController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();
  }

  void decrementCount({required bool isInCart}) {
    if (isInCart) {
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
            oldUser: _authController.user.value!,
            newUser: UserModel(
                itemsInCart: _authController.user.value!.itemsInCart!),
            uid: _authController.user.value!.userId!);
      }
    } else {
      setState(() {
        if (itemCount > 1) {
          itemCount -= 1;
        }
      });
    }
  }

  void incrementCount({required bool isInCart}) {
    if (isInCart) {
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
            oldUser: _authController.user.value!,
            newUser: UserModel(
                itemsInCart: _authController.user.value!.itemsInCart!),
            uid: _authController.user.value!.userId!);
      }
    } else {
      setState(() {
        if (itemCount < widget.product.productStockCount!) {
          itemCount += 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 24,
      children: [
        Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            "Product Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        //  product details header
        Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              //  image
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: XploreColors.deepBlue,
                    borderRadius: BorderRadius.circular(24)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: widget.product.productImageUrls != null &&
                      widget.product.productImageUrls!.isNotEmpty
                      ? Image.network(
                    widget.product.productImageUrls![0],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Icon(
                    Icons.add_shopping_cart_rounded,
                    color: XploreColors.white,
                  ),
                ),
              ),

              hSize10SizedBox,

              //  description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.productName!,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        PopupMenuButton(
                          itemBuilder: (context) => [
                            //  update product
                            PopupMenuItem(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit_rounded,
                                    size: 16,
                                    color: XploreColors.xploreOrange,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Edit Product",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium,
                                  )
                                ],
                              ),
                            ),
                            //  delete product
                            PopupMenuItem(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_forever_rounded,
                                    size: 16,
                                    color: XploreColors.xploreOrange,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Delete Product",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium,
                                  )
                                ],
                              ),
                            ),
                          ],
                          color: XploreColors.white,
                          icon: Icon(
                            Icons.more_vert_rounded,
                            color: XploreColors.deepBlue,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.monetization_on_rounded,
                          color: XploreColors.xploreOrange,
                        ),
                        hSize10SizedBox,
                        Text(
                            'Ksh. ${widget.product.productSellingPrice!.toString().addCommas}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //  category
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: XploreColors.xploreOrange),
                          child: Row(
                            children: [
                              Icon(
                                widget.product.productCategoryId!.isNotEmpty
                                    ? Constants.productCategoriesFiltered
                                    .firstWhere((category) =>
                                category.categoryName ==
                                    widget.product.productCategoryId!)
                                    .categoryIcon
                                    : Icons.category_rounded,
                                color: XploreColors.white,
                                size: 16,
                              ),
                              hSize5SizedBox,
                              Text(
                                '${widget.product.productCategoryId!.isEmpty ? "No category" : widget.product.productCategoryId!}',
                                style: TextStyle(color: XploreColors.white),
                              ),
                            ],
                          ),
                        ),
                        Text(
                            '${widget.product.productStockCount!.toString().addCommas} in stock'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        //  add to cart button
        // Align(
        //   alignment: AlignmentDirectional.bottomCenter,
        //   child: UnconstrainedBox(
        //     child: Obx(
        //           () {
        //         final isInCart = _authController.user.value!.itemsInCart!
        //             .map((item) => item.cartProductId)
        //             .toList()
        //             .contains(widget.product.productId!);
        //
        //         return Container(
        //           width: isInCart ? 325 : 320,
        //           height: 60,
        //           margin: const EdgeInsets.all(16),
        //           decoration: BoxDecoration(
        //               color: XploreColors.deepBlue,
        //               borderRadius: BorderRadius.circular(100)),
        //           child: Row(
        //             children: [
        //               Expanded(
        //                   flex: 5,
        //                   child: Container(
        //                       padding:
        //                       const EdgeInsets.symmetric(horizontal: 16),
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.only(
        //                               topLeft: Radius.circular(100),
        //                               bottomLeft: Radius.circular(100))),
        //                       child: Row(
        //                         mainAxisAlignment:
        //                         MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           //  minus icon
        //                           GestureDetector(
        //                             onTap: () =>
        //                                 decrementCount(isInCart: isInCart),
        //                             child: Container(
        //                               width: 35,
        //                               height: 35,
        //                               decoration: BoxDecoration(
        //                                 border: Border.all(
        //                                     color: XploreColors.white,
        //                                     width: 4),
        //                                 borderRadius:
        //                                 BorderRadius.circular(100),
        //                                 color: XploreColors.deepBlue,
        //                               ),
        //                               child: Center(
        //                                 child: Icon(
        //                                   Icons.remove_rounded,
        //                                   color: XploreColors.white,
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //
        //                           //  counter
        //                           Expanded(
        //                             child: Center(
        //                               child: isInCart
        //                                   ? Obx(() => Text(
        //                                 _authController
        //                                     .user.value!.itemsInCart!
        //                                     .firstWhere((item) =>
        //                                 item.cartProductId ==
        //                                     widget.product
        //                                         .productId!)
        //                                     .cartProductCount
        //                                     .toString(),
        //                                 style: TextStyle(
        //                                     fontSize: 18,
        //                                     fontWeight:
        //                                     FontWeight.bold,
        //                                     color: XploreColors.white,
        //                                     overflow: TextOverflow
        //                                         .ellipsis),
        //                               ))
        //                                   : Text(
        //                                 itemCount.toString(),
        //                                 style: TextStyle(
        //                                     fontSize: 18,
        //                                     fontWeight: FontWeight.bold,
        //                                     color: XploreColors.white,
        //                                     overflow:
        //                                     TextOverflow.ellipsis),
        //                               ),
        //                             ),
        //                           ),
        //
        //                           //  Add Icon
        //                           GestureDetector(
        //                             onTap: () =>
        //                                 incrementCount(isInCart: isInCart),
        //                             child: Container(
        //                               width: 35,
        //                               height: 35,
        //                               decoration: BoxDecoration(
        //                                 border: Border.all(
        //                                     color: XploreColors.white,
        //                                     width: 4),
        //                                 borderRadius:
        //                                 BorderRadius.circular(100),
        //                                 color: XploreColors.deepBlue,
        //                               ),
        //                               child: Center(
        //                                 child: Icon(
        //                                   Icons.add_rounded,
        //                                   color: XploreColors.white,
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ))),
        //               Expanded(
        //                   flex: isInCart ? 7 : 5,
        //                   child: Container(
        //                     decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.only(
        //                             topRight: Radius.circular(100),
        //                             bottomRight: Radius.circular(100))),
        //                     child: GestureDetector(
        //                       onTap: () async {
        //                         //  get initial cart items
        //                         final List<CartModel> itemsInCart =
        //                         _authController.user.value!.itemsInCart!;
        //                         //  update the list
        //                         if (isInCart) {
        //                           //  remove item from list
        //                           itemsInCart.removeWhere((item) =>
        //                           item.cartProductId! ==
        //                               widget.product.productId!);
        //
        //                           setState(() {});
        //
        //                           //  update items in cart
        //                           await _authController
        //                               .updateUserDataInFirestore(
        //                               oldUser:
        //                               _authController.user.value!,
        //                               newUser: UserModel(
        //                                   itemsInCart: itemsInCart),
        //                               uid: _authController
        //                                   .user.value!.userId!);
        //                         } else {
        //                           //  Add item to list
        //                           itemsInCart.add(CartModel(
        //                               cartProductId:
        //                               widget.product.productId!,
        //                               cartProductCount: itemCount));
        //                           setState(() {});
        //                           //  update items in cart
        //                           await _authController
        //                               .updateUserDataInFirestore(
        //                               oldUser:
        //                               _authController.user.value!,
        //                               newUser: UserModel(
        //                                   itemsInCart: itemsInCart),
        //                               uid: _authController
        //                                   .user.value!.userId!);
        //                         }
        //                       },
        //                       child: UnconstrainedBox(
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                               color: isInCart
        //                                   ? XploreColors.red
        //                                   : XploreColors.xploreOrange,
        //                               borderRadius:
        //                               BorderRadius.circular(100)),
        //                           padding: const EdgeInsets.symmetric(
        //                               horizontal: 12, vertical: 8),
        //                           child: Row(
        //                             children: [
        //                               Icon(
        //                                   isInCart
        //                                       ? Icons
        //                                       .remove_shopping_cart_rounded
        //                                       : Icons
        //                                       .add_shopping_cart_rounded,
        //                                   color: XploreColors.white),
        //                               hSize10SizedBox,
        //                               Text(
        //                                 isInCart
        //                                     ? "Remove from cart"
        //                                     : "Add to cart",
        //                                 style: TextStyle(
        //                                     color: XploreColors.white,
        //                                     fontWeight: FontWeight.bold),
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   )),
        //             ],
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // )
      ],
    );
  }
}
