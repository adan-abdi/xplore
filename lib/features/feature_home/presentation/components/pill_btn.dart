import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class PillBtn extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final String? imageAsset;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  const PillBtn(
      {super.key,
      required this.text,
      this.iconData,
      this.imageAsset,
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
              color: isActive
                  ? activeColor
                  : XploreColors.white,
              borderRadius: BorderRadius.circular(100)),
          child: Center(
              child: Row(
            children: [
              iconData == null
                  ? Image.asset(
                      imageAsset!,
                      width: 26,
                      height: 26,
                    )
                  : Icon(iconData,
                      color:
                          isActive ? XploreColors.white : XploreColors.xploreOrange),
              hSize10SizedBox,
              Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isActive ? XploreColors.white : XploreColors.deepBlue),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
