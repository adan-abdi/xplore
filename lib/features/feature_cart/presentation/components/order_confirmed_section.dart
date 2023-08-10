import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/presentation/model/payment_method.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_home/presentation/screens/home_page.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';

import '../../../feature_main/main_screen.dart';
import '../../../feature_merchant_store/domain/model/transaction_model.dart';
import '../controller/cart_controller.dart';

class OrderConfirmedSection extends StatefulWidget {
  const OrderConfirmedSection({super.key});

  @override
  State<OrderConfirmedSection> createState() => _OrderConfirmedSectionState();
}

class _OrderConfirmedSectionState extends State<OrderConfirmedSection> {
  late final CartController _cartController;
  late final HomeController _homeController;
  late final MerchantController _merchantController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _cartController = Get.find<CartController>();
    _homeController = Get.find<HomeController>();
    _merchantController = Get.find<MerchantController>();
    _authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _cartController.isOrderPast.value ? 1 : 0.1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  title
            Row(
              children: [
                Text("Order Confirimed!",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                hSize20SizedBox,
                MyLottie(
                  lottie: 'assets/general/success.json',
                  width: 30,
                  height: 30,
                  repeat: false,
                ),
              ],
            ),

            vSize10SizedBox,

            Text("Thank you for shopping with Dukalink!",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),

            //  proceed button
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: TextButton(
                  onPressed: () async {
                    //  update merchant transactions
                    _authController.user.value!.itemsInCart!
                        .forEach((cartItem) async {
                      //  get seller id & product id
                      final sellerId = _homeController.products
                          .firstWhere((product) =>
                              product.productId! == cartItem.cartProductId!)
                          .sellerId!;

                      final product = _homeController.products.firstWhere(
                          (product) =>
                              product.productId! == cartItem.cartProductId!);

                      final sellerData = await _authController
                          .getSpecificUserFromFirestore(uid: sellerId);

                      final allTransactions = sellerData.transactions!;

                      allTransactions.add(TransactionModel(
                          buyerId: _authController.user.value!.userId!,
                          productId: cartItem.cartProductId!,
                          itemsBought: cartItem.cartProductCount!,
                          amountPaid: product.productSellingPrice! *
                              cartItem.cartProductCount!,
                          transactionDate: DateTime.now().toString(),
                          isFulfilled: true));

                      _authController
                          .updateUserDataInFirestore(
                              oldUser: sellerData,
                              newUser: UserModel(transactions: allTransactions),
                              uid: sellerId)
                          .then((value) {
                        //  update product stock count
                        _merchantController.updateProduct(
                            oldProduct: product,
                            newProduct: ProductModel(
                                productStockCount: product.productStockCount! -
                                    cartItem.cartProductCount!),
                            response: (state) {});
                      });
                    });

                    //  clear all cart items
                    _authController.updateUserDataInFirestore(
                        oldUser: _authController.user.value!,
                        newUser: UserModel(itemsInCart: []),
                        uid: _authController.user.value!.userId!);

                    //  go to home page
                    Get.offAll(MainScreen());
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: XploreColors.xploreOrange),
                  child: Text("Done")),
            )
          ],
        ),
      ),
    );
  }
}
