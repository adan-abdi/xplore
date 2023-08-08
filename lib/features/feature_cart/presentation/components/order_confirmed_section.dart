import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/presentation/model/payment_method.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';

import '../controller/cart_controller.dart';

class OrderConfirmedSection extends StatefulWidget {
  const OrderConfirmedSection({super.key});

  @override
  State<OrderConfirmedSection> createState() => _OrderConfirmedSectionState();
}

class _OrderConfirmedSectionState extends State<OrderConfirmedSection> {

  late final CartController _cartController;

  @override
  void initState() {
    super.initState();

    _cartController = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _cartController.isOrderPast.value ? 1 : 0.1,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  title
            Row(
              children: [
                Text("Order Confirimed!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                hSize20SizedBox,
                MyLottie(
                  lottie: 'assets/general/success.json',
                  width: 50,
                  height: 50,
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
                  onPressed: () {
                    //  clear all cart items
                    //  go to home page
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
