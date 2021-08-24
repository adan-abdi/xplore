import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget termsAndConditions(BuildContext context,
    [TextAlign align = TextAlign.center]) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "landingTerms",
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.grey),
          ),
          TextSpan(
            text: "landingTAndC",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontStyle: FontStyle.normal,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ///  todo: add terms and conditions link here
                // triggerNavigationEvent(context: context, route: webViewRoute);
              },
          ),
        ],
      ),
      textAlign: align,
    ),
  );
}