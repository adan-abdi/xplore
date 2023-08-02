import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class HamburgerMenuBtn extends StatelessWidget {
  final VoidCallback onTap;

  const HamburgerMenuBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: XploreColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HamburgerBtn(width: 25),
            SizedBox(height: 4,),
            HamburgerBtn(width: 15),
            SizedBox(height: 4,),
            HamburgerBtn(width: 8),
          ],
        ),
      ),
    );
  }

  Widget HamburgerBtn({required double width}) => Container(
        width: width,
        height: 5,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
            color: XploreColors.deepBlue, borderRadius: BorderRadius.circular(30)),
      );
}
