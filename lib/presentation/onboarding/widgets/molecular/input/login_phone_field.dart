// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/button_status.dart';

class PhoneLoginField extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final ButtonStatusStore btnStore;
  final Function(String)? onChanged;

  const PhoneLoginField({
    Key? key,
    required this.phoneNumberController,
    required this.btnStore,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PhoneLoginField> createState() => _PhoneLoginFieldState();
}

class _PhoneLoginFieldState extends State<PhoneLoginField> {
  @override
  void initState() {
    super.initState();
    widget.phoneNumberController.text = '+254';
  }

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
            hintStyle: TextStyle(color: XploreColors.deepBlue.withOpacity(.6)),
          ),
          readOnly: true,
          showCursor: true,
          cursorColor: XploreColors.orange,
          autofocus: true,
          style: TextStyle(fontSize: 28),
          onChanged: widget.onChanged!,
        ),
      ),
    );
  }
}
