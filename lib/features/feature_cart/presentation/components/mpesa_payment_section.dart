import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../../application/core/themes/colors.dart';

class MpesaPaymentSection extends StatefulWidget {
  final int total;

  const MpesaPaymentSection({super.key, required this.total});

  @override
  State<MpesaPaymentSection> createState() => _MpesaPaymentSectionState();
}

class _MpesaPaymentSectionState extends State<MpesaPaymentSection> {

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
          Row(
            children: [
              Image.asset('assets/general/mpesa_new.png', width: 50),
              hSize20SizedBox,
              Text("Lipa na M-Pesa",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),

          vSize20SizedBox,

          //  box to enter M-Pesa amount
          CustomTextField(
              hint: " Ksh. ${widget.total}",
              iconData: Icons.attach_money_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.number,
              isEnabled: false,
              onChanged: (value) {

              }),

          vSize20SizedBox,

          //  box to enter M-Pesa amount
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
                child: Text("Pay", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
          ),
        ],
      ),
    );
  }
}
