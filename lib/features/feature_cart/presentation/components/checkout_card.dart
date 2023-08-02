import 'package:flutter/material.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';

import '../../../../application/core/themes/colors.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({super.key});

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: XploreColors.deepBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal",
                  style: TextStyle(
                      fontSize: 18,
                      color: XploreColors.whiteSmoke,
                      fontWeight: FontWeight.bold)),
              Text("Ksh. 350",
                  style: TextStyle(
                      fontSize: 24,
                      color: XploreColors.white,
                      fontWeight: FontWeight.bold)),
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
              Text("Ksh. 350",
                  style: TextStyle(
                      fontSize: 24,
                      color: XploreColors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),

          //  checkout button
          SubmitButton(
              iconData: Icons.shopping_bag_rounded,
              text: "Checkout",
              backgroundColor: XploreColors.xploreOrange,
              onTap: () {})
        ],
      ),
    );
  }
}
