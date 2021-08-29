import 'package:flutter/material.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';

/// - [LandingActions] which provides navigation buttons to user that lead to:
///   - 1 => phoneSignupRoute - Prompts user to signup/register
///   - 2 => phoneLoginRoute - Prompts user to login
class LandingActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(snackbar(
                content: comingSoonText,
              ));
            },
            child: const Text(siginText),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(snackbar(
                content: comingSoonText,
              ));
            },
            child: const Text(signupText),
          ),
        ),
      ],
    );
  }
}
