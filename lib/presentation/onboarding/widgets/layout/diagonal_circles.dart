// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';

List<Widget> diagonalCircles(
  BuildContext context, {
  Color? ringColor1,
  Color? ringColor2,
}) {
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
          color: ringColor1 ?? XploreColors.orange,
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
          color: ringColor2 ?? XploreColors.lightOrange,
        ),
      ),
    ),
  ];
}
