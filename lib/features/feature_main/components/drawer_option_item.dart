import 'package:flutter/material.dart';

import '../../../application/core/themes/colors.dart';
import '../../../domain/value_objects/app_spaces.dart';

class DrawerOptionItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData iconData;

  const DrawerOptionItem(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: XploreColors.deepBlue,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Icon(iconData, color: XploreColors.whiteSmoke),
            hSize20SizedBox,
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: XploreColors.white,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}
