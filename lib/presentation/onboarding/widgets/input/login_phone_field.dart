import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/singletons/button_status.dart';

class PhoneLoginField extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final ButtonStatusStore btnStore;

  const PhoneLoginField(
      {Key? key, required this.phoneNumberController, required this.btnStore})
      : super(key: key);

  @override
  State<PhoneLoginField> createState() => _PhoneLoginFieldState();
}

class _PhoneLoginFieldState extends State<PhoneLoginField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
        color: XploreColors.white,
      ),
      child: Container(
        alignment: Alignment.center,
        child: TextField(
          controller: widget.phoneNumberController,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '+(254) 700 000 000',
          ),
          readOnly: true,
          showCursor: true,
          autofocus: true,
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
