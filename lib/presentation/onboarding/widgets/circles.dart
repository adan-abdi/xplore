import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';

List<Widget> circles(BuildContext context, Color? circleColor) {
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
          color: circleColor ?? XploreColors.whiteSmoke,
        ),
      ),
    ),
  ];
}
