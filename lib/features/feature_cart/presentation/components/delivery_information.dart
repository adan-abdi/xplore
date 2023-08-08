import 'package:flutter/material.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';

class DeliveryInformation extends StatelessWidget {
  const DeliveryInformation({super.key});

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
                  text: "Normal",
                  iconData: Icons.payment_rounded,
                  onTap: () {},
                  isActive: false)
            ],
          )
        ],
      ),
    );
  }
}
