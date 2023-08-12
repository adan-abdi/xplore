import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/domain/model/payment_types.dart';
import 'package:shamiri/features/feature_cart/presentation/model/payment_method.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';

import '../controller/cart_controller.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  late final List<PaymentMethod> paymentMethods;

  late final CartController _cartController;

  @override
  void initState() {
    super.initState();

    _cartController = Get.find<CartController>();

    paymentMethods = [
      PaymentMethod(
          title: "Cash",
          iconData: Icons.monetization_on_rounded,
          paymentType: PaymentTypes.cash),
      PaymentMethod(
          title: "M-Pesa",
          svgAsset: 'assets/general/mpesa.png',
          paymentType: PaymentTypes.mpesa),
      PaymentMethod(
          title: "Deni",
          iconData: Icons.menu_book_rounded,
          paymentType: PaymentTypes.deni),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  title
          Text("Payment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          vSize10SizedBox,

          Text("Choose payment method.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),

          // delivery pills
          vSize20SizedBox,

          Container(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) => Obx(
                  () => PillBtn(
                    text: paymentMethods[index].title,
                    iconData: paymentMethods[index].iconData,
                    imageAsset: paymentMethods[index].svgAsset,
                    isActive: _cartController.activePaymentType.value ==
                        paymentMethods[index].paymentType,
                    onTap: () => _cartController.setActivePaymentType(
                        paymentType: paymentMethods[index].paymentType)),
              ),
              separatorBuilder: (context, index) => hSize10SizedBox,
            ),
          ),
        ],
      ),
    );
  }
}
