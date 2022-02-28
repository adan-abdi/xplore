import 'package:flutter/material.dart';
import 'package:xplore/domain/value_objects/app_asset_strings.dart';

List<Widget> circles(BuildContext context) {
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
          color: Theme.of(context).accentColor.withOpacity(0.04),
        ),
      ),
    ),
  ];
}
