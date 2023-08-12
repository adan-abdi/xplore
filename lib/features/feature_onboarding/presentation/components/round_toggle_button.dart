import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class RoundToggleButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const RoundToggleButton(
      {super.key, required this.iconData, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: XploreColors.deepBlue),
              child: Center(
                child: Icon(
                  iconData,
                  color: XploreColors.white,
                ),
              ),
            ),
            vSize10SizedBox,
            Text(
              title,
            )
          ],
        ),
      ),
    );
  }
}
