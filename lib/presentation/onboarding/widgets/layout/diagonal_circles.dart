// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';

List<Widget> diagonalCircles(BuildContext context, Color? circleColor) {
  const double diagonalCircleDiameter = 350;
  return <Widget>[
    Positioned(
      top: -(diagonalCircleDiameter / 2),
      right: -(diagonalCircleDiameter / 2),
      child: Container(
        width: diagonalCircleDiameter,
        height: diagonalCircleDiameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: XploreColors.orange,
        ),
      ),
    ),
    Positioned(
      bottom: -(diagonalCircleDiameter / 2),
      left: -(diagonalCircleDiameter / 2),
      child: Container(
        width: diagonalCircleDiameter,
        height: diagonalCircleDiameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: XploreColors.orange,
        ),
      ),
    ),
  ];
}
