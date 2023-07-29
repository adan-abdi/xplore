import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class HamburgerMenuBtn extends StatelessWidget {
  final VoidCallback onTap;

  const HamburgerMenuBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: UnconstrainedBox(
        child: Container(
          width: 30,
          height: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HamburgerBtn(width: 25),
              HamburgerBtn(width: 15),
              HamburgerBtn(width: 8),
            ],
          ),
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
