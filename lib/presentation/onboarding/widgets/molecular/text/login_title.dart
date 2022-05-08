// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_magic_numbers.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

List<Widget> titles({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String extraHeading,
  double? titleFontSize,
  double? headingFontSize,
}) {
  return <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: XploreColors.deepBlue,
            fontSize: titleFontSize ?? 36,
            fontWeight: FontWeight.normal,
          ),
          children: <TextSpan>[
            TextSpan(
                text: subtitle,
                style: TextStyle(
                  color: XploreColors.black,
                  fontSize: titleFontSize ?? 36,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
    ),
    vSize10SizedBox,
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        extraHeading,
        style: TextStyle(
          color: XploreColors.deepBlue,
          fontSize: headingFontSize ?? defaultFontSize,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.start,
      ),
    ),
  ];
}
