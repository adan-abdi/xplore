import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/presentation/model/payment_method.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  late final List<PaymentMethod> paymentMethods;

  @override
  void initState() {
    super.initState();

    paymentMethods = [
      PaymentMethod(title: "Cash", iconData: Icons.monetization_on_rounded),
      PaymentMethod(title: "M-Pesa", svgAsset: 'assets/general/mpesa.png'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                itemBuilder: (context, index) => PillBtn(
                    text: paymentMethods[index].title,
                    iconData: paymentMethods[index].iconData,
                    imageAsset: paymentMethods[index].svgAsset,
                    isActive: false,
                    onTap: () {}),
            separatorBuilder: (context, index) => hSize10SizedBox,),
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
