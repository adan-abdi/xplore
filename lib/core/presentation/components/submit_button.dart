import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class SubmitButton extends StatelessWidget {

  final IconData iconData;
  final String text;
  final VoidCallback? onTap;

  const SubmitButton({super.key, required this.iconData, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: XploreColors.deepBlue,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData, color: XploreColors.white,),
            hSize20SizedBox,
            Text(text, style: TextStyle(fontSize: 20, color: XploreColors.white, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
