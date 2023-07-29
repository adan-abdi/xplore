import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class HamburgerMenuBtn extends StatelessWidget {
  final VoidCallback onTap;

  const HamburgerMenuBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HamburgerBtn(width: 30),
            HamburgerBtn(width: 20),
            HamburgerBtn(width: 10),
          ],
        ),
      ),
    );
  }

  Widget HamburgerBtn({required double width}) => Container(
        width: width,
        height: 5,
        decoration: BoxDecoration(
            color: XploreColors.deepBlue, borderRadius: BorderRadius.circular(30)),
      );
}
