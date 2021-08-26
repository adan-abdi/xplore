import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';

Widget termsAndConditions(BuildContext context,
    [TextAlign align = TextAlign.center]) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: XploreStrings.landingTerms,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.grey),
          ),
          TextSpan(
            text: XploreStrings.landingTAndC,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontStyle: FontStyle.normal,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ScaffoldMessenger.of(context).showSnackBar(snackbar(
                  content: XploreStrings.comingSoonText,
                ));
              },
          ),
        ],
      ),
      textAlign: align,
    ),
  );
}
