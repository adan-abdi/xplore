import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  title
          Text("Delivery Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          vSize10SizedBox,

          Text("Choose delivery type",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),

          // delivery pills
          vSize20SizedBox,

          Row(
            children: [
              PillBtn(
                  text: "Delivery",
                  iconData: Icons.car_crash_rounded,
                  onTap: () {},
                  isActive: true),
              hSize20SizedBox,
              PillBtn(
                  text: "Pick up",
                  iconData: Icons.shopping_basket_rounded,
                  onTap: () {},
                  isActive: false)
            ],
          ),

          //  proceed button
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    foregroundColor: XploreColors.xploreOrange),
                child: Text("Next")),
          )
        ],
      ),
    );
  }
}
