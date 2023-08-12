import 'package:flutter/material.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../../application/core/themes/colors.dart';

class CashPaymentSection extends StatefulWidget {
  const CashPaymentSection({super.key});

  @override
  State<CashPaymentSection> createState() => _CashPaymentSectionState();
}

class _CashPaymentSectionState extends State<CashPaymentSection> {

  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();

    _phoneNumberController = TextEditingController();
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
          Text("Customer Details (optional)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          vSize10SizedBox,

          Text("Enter customer phone number to send receipt.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),

          vSize20SizedBox,

          //  customer phone number
          CustomTextField(
              hint: "Phone number",
              iconData: Icons.phone_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.number,
              controller: _phoneNumberController,
              onChanged: (value) {

              }),

          vSize20SizedBox,

          //  proceed button
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                    foregroundColor: XploreColors.xploreOrange),
                child: Text("Confirm Order", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
          ),
        ],
      ),
    );
  }
}
