// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_magic_numbers.dart';

class LandingPageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hSizeDimension = MediaQuery.of(context).size.height;
    final mainTitleFontSize = hSizeDimension * 0.07;
    final andFontSize = hSizeDimension * 0.05;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Fast \n',
              style: TextStyle(
                  color: XploreColors.deepBlue,
                  fontSize: mainTitleFontSize,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '   & ',
                    style: TextStyle(
                      color: XploreColors.xploreOrange,
                      fontSize: andFontSize,
                      fontWeight: FontWeight.normal,
                    )),
                TextSpan(
                  text: 'Digital.',
                  style: TextStyle(
                    color: XploreColors.deepBlue,
                    fontSize: mainTitleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
