// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/button_status.dart';

class PhoneLoginField extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final Function(String)? onChanged;

  const PhoneLoginField({
    Key? key,
    required this.phoneNumberController,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PhoneLoginField> createState() => _PhoneLoginFieldState();
}

class _PhoneLoginFieldState extends State<PhoneLoginField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: XploreColors.white,
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Container(
              width: 70,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: XploreColors.xploreOrange,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              child: Center(child: Text("+254", style: TextStyle(fontSize: 20, color: XploreColors.white),)),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: XploreColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: widget.phoneNumberController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '+(254) 7 xx xxx xxx',
                      hintStyle:
                          TextStyle(color: XploreColors.deepBlue.withOpacity(.6)),
                      fillColor: XploreColors.white),
                  readOnly: true,
                  showCursor: true,
                  cursorColor: XploreColors.orange,
                  autofocus: true,
                  style: TextStyle(fontSize: 20, letterSpacing: 4),
                  onChanged: widget.onChanged!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
