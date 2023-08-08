import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/presentation/model/payment_method.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';

class OrderConfirmedSection extends StatefulWidget {
  const OrderConfirmedSection({super.key});

  @override
  State<OrderConfirmedSection> createState() => _OrderConfirmedSectionState();
}

class _OrderConfirmedSectionState extends State<OrderConfirmedSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                onPressed: () {},
                style: TextButton.styleFrom(
                    foregroundColor: XploreColors.xploreOrange),
                child: Text("Done")),
          )
        ],
      ),
    );
  }
}
