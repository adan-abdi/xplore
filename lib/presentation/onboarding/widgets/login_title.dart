import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/domain/value_objects/app_magic_numbers.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';

List<Widget> titles({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String extraHeading,
}) {
  return <Widget>[
    Positioned(
      left: 0,
      right: 0,
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: XploreColors.deepBlue,
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
          children: <TextSpan>[
            TextSpan(
                text: subtitle,
                style: TextStyle(
                  color: XploreColors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
    ),
    vSize20SizedBox,
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        extraHeading,
        style: TextStyle(
          color: XploreColors.deepBlue,
          fontSize: defaultFontSize,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.start,
      ),
    ),
  ];
}

// class LoginTitle extends StatelessWidget {
//   final String? title;
//   final String? subtitle;
//   final String? extraHeading;

//   const LoginTitle({Key? key, this.title, this.subtitle, this.extraHeading})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [],
//     );
//   }
// }
