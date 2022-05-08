// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';

Widget termsAndConditions(BuildContext context, [TextAlign align = TextAlign.center]) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: landingTerms,
            style: TextStyle(
              color: XploreColors.black,
            ),
          ),
          TextSpan(
            text: landingTAndC,
            style: TextStyle(color: XploreColors.black),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ScaffoldMessenger.of(context).showSnackBar(snackbar(
                  content: comingSoonText,
                ));
              },
          ),
        ],
      ),
      textAlign: align,
    ),
  );
}
