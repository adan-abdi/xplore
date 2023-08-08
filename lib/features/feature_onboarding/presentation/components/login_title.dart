// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_magic_numbers.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

List<Widget> titles({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String extraHeading,
  bool canExtraHeading = false,
  double? titleFontSize,
  double? headingFontSize,
}) {
  return <Widget>[
    RichText(
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
    canExtraHeading
        ? Row(
            children: [
              Text(
                extraHeading,
                style: TextStyle(
                  color: XploreColors.deepBlue,
                  fontSize: headingFontSize ?? defaultFontSize,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.start,
              ),
              hSize20SizedBox,
              TextButton(
                  onPressed: () => Get.back(),
                  style: TextButton.styleFrom(
                    foregroundColor: XploreColors.xploreOrange
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.edit_rounded, size: 16),
                      hSize10SizedBox,
                      Text("Edit",
                          style: TextStyle(
                            fontSize: headingFontSize ?? defaultFontSize,
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ))
            ],
          )
        : Text(
            extraHeading,
            style: TextStyle(
              color: XploreColors.deepBlue,
              fontSize: headingFontSize ?? defaultFontSize,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.start,
          ),
  ];
}
