import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class ImagePickerItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const ImagePickerItem(
      {super.key, required this.iconData, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
