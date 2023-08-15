import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class StoreOverviewCardSettings extends StatelessWidget {

  final IconData iconData;
  final String title;
  final String itemCount;

  const StoreOverviewCardSettings({super.key, required this.iconData, required this.title, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 80,
        child: Card(
          color: XploreColors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(iconData,
                        color: XploreColors.xploreOrange, size: 14),
                    hSize5SizedBox,
                    Text(title)
                  ],
                ),

                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: itemCount,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis)),
                      TextSpan(text: " items",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis)),
                    ]
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
