// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';

class XploreIconCard extends StatelessWidget {
  final IconData icon;
  final Function() iconOnPress;
  final Color? iconColor;
  final bool withElevation;

  const XploreIconCard({
    Key? key,
    required this.icon,
    required this.iconOnPress,
    this.iconColor,
    this.withElevation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => iconOnPress(),
        child: Icon(
          icon,
          color: iconColor ?? XploreColors.white,
        ),
      ),
    );
  }
}
