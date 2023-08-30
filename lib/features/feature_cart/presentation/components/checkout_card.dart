import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/presentation/screens/checkout_screen.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../core/domain/model/cart_model.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';

class CheckoutCard extends StatefulWidget {
  final List<CartModel> itemsInCart;
  final List<ProductModel> products;

  const CheckoutCard(
      {super.key, required this.itemsInCart, required this.products});

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  late final AuthController _authController;
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _authController = Get.find();
    _homeController = Get.find();
  }

  int getTotalAmount() {
    if (widget.itemsInCart.isEmpty) {
      return 0;
    }

    var total = 0;

    widget.itemsInCart.forEach((item) {
      final variations = widget.products
          .firstWhere((product) => product.productId! == item.cartProductId!)
          .activeProductVariations!;

      final sellingPrice = widget.products
          .firstWhere((product) => product.productId! == item.cartProductId!)
          .productSellingPrice!;

      total += ((item.cartProductCount! +
                  (variations.length <= item.cartProductCount!
                      ? 0
                      : variations.length - item.cartProductCount!)) *
              sellingPrice) +
          _homeController.getTotalFromProductVariations(variations: variations);
    });

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        color: XploreColors.deepBlue,
      ),
      child: Wrap(
        runSpacing: 24,
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_long_rounded,
                color: XploreColors.xploreOrange,
              ),
              hSize10SizedBox,
              Text("Order Summary",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: XploreColors.white)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal",
                  style: TextStyle(
                      fontSize: 18,
                      color: XploreColors.whiteSmoke,
                      fontWeight: FontWeight.bold)),
              Obx(() => Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Ksh. ",
                        style: TextStyle(
                            fontSize: 18,
                            color: XploreColors.whiteSmoke,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${getTotalAmount().toString().addCommas}",
                        style: TextStyle(
                            fontSize: 21,
                            color: XploreColors.white,
                            fontWeight: FontWeight.bold)),
                  ]))),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",
                  style: TextStyle(
                      fontSize: 18,
                      color: XploreColors.white,
                      fontWeight: FontWeight.bold)),
              Obx(() => Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Ksh. ",
                        style: TextStyle(
                            fontSize: 18,
                            color: XploreColors.whiteSmoke,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${getTotalAmount().toString().addCommas}",
                        style: TextStyle(
                            fontSize: 21,
                            color: XploreColors.white,
                            fontWeight: FontWeight.bold)),
                  ]))),
            ],
          ),

          //  checkout button
          SubmitButton(
              iconData: Icons.shopping_bag_rounded,
              text: "Checkout",
              backgroundColor: XploreColors.xploreOrange,
              isValid: true,
              onTap: () => Get.to(() => CheckoutScreen(
                    totalToPay: getTotalAmount(),
                  )))
        ],
      ),
    );
  }
}
