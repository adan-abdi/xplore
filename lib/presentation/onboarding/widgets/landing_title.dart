// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/domain/value_objects/app_magic_numbers.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';

class LandingPageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Fast \n',
              style: TextStyle(
                  color: XploreColors.deepBlue,
                  fontSize: 55,
                  fontWeight: FontWeight.bold),
              children: const <TextSpan>[
                TextSpan(
                    text: '   & ',
                    style: TextStyle(
                      color: XploreColors.black,
                      fontSize: 48,
                      fontWeight: FontWeight.normal,
                    )),
                TextSpan(
                  text: 'Digital.',
                  style: TextStyle(
                    color: XploreColors.deepBlue,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          vSize30SizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Keep your store in order , Easy to use  point of sale',
              style: TextStyle(
                color: XploreColors.black,
                fontSize: defaultFontSize,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
