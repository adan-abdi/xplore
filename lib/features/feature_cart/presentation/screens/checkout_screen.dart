import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/presentation/components/checkout_tile.dart';
import 'package:shamiri/features/feature_cart/presentation/components/credit_payment_section.dart';
import 'package:shamiri/features/feature_cart/presentation/components/mpesa_payment_section.dart';
import 'package:shamiri/features/feature_cart/presentation/components/payment_section.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/login_title.dart';

import '../../../../application/core/themes/colors.dart';
import '../../domain/model/payment_types.dart';
import '../components/cash_payment_section.dart';
import '../controller/cart_controller.dart';

class CheckoutScreen extends StatefulWidget {
  final int totalToPay;

  const CheckoutScreen({super.key, required this.totalToPay});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late final CartController _cartController;

  @override
  void initState() {
    super.initState();

    _cartController = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: XploreColors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: XploreColors.white,
              systemNavigationBarColor: XploreColors.white,
              systemNavigationBarIconBrightness: Brightness.dark),
          title: Text(
            "Checkout",
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header
                  ...titles(
                      context: context,
                      title: "Place \n",
                      subtitle: "Your Order",
                      extraHeading:
                          "Total to pay : Ksh. ${widget.totalToPay.toString().addCommas}"),

                  vSize30SizedBox,

                  //  payment information
                  CheckoutTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      iconData: Icons.attach_money_rounded,
                      content: PaymentSection()),

                  //  payment methods
                  Obx(
                    () {
                      switch (_cartController.activePaymentType.value) {
                        case PaymentTypes.cash:
                          //  Cash payment
                          return CheckoutTile(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              iconData: Icons.person_pin_rounded,
                              content: CashPaymentSection(totalToPay: widget.totalToPay,));
                        case PaymentTypes.mpesa:
                          //  M-Pesa payment
                          return CheckoutTile(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              iconData: Icons.person_pin_rounded,
                              content: MpesaPaymentSection(
                                total: widget.totalToPay,
                              ));
                        case PaymentTypes.credit:
                        //  Credit payment
                          return CheckoutTile(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              iconData: Icons.loyalty_rounded,
                              content: CreditPaymentSection(
                                total: widget.totalToPay,
                              ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
