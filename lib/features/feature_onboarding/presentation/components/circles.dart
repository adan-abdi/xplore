// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';

List<Widget> circles(BuildContext context, {Color? circleColor}) {
  const double circleSize = 1000;
  const double circleOffscreenSize = -500;
  return <Widget>[
    Positioned(
      top: circleOffscreenSize,
      left: circleOffscreenSize,
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: circleColor ?? XploreColors.whiteSmoke.withOpacity(0.5),
        ),
      ),
    ),
  ];
}
