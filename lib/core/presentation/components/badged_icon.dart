import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../../application/core/themes/colors.dart';

class BadgeIcon extends StatelessWidget {
  final int badgeCount;
  final IconData iconData;

  const BadgeIcon({super.key, required this.badgeCount, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -12, end: -8),
      badgeContent: Text(
        badgeCount.toString(),
        style: TextStyle(
            color: XploreColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12),
      ),
      badgeStyle: badges.BadgeStyle(
        badgeColor: XploreColors.xploreOrange,
      ),
      showBadge: !(badgeCount < 1),
      badgeAnimation: badges.BadgeAnimation.scale(),
      child: Icon(
        iconData,
        color: XploreColors.deepBlue,
      ),
    );
  }
}
