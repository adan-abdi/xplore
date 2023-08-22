import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class PillBtnAlt extends StatelessWidget {
  final String text;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  const PillBtnAlt({super.key,
    required this.text,
    this.isActive = false,
    this.activeColor = XploreColors.xploreOrange,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              color: isActive ? activeColor : XploreColors.white,
              borderRadius: BorderRadius.circular(8),
              border: isActive ? Border.fromBorderSide(BorderSide.none) : Border.all(
                  color: XploreColors.deepBlue.withOpacity(0.2), width: 2)),
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color:
                    isActive ? XploreColors.white : XploreColors.deepBlue),
              )),
        ),
      ),
    );
  }
}
