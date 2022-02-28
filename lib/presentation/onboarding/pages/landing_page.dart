import 'package:flutter/material.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/presentation/onboarding/widgets/circles.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_actions.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_vector.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_page_title.dart';
import 'package:xplore/presentation/onboarding/widgets/terms_and_conditions.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ...circles(context),
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: 30,
                      runSpacing: 40,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            LandingPageTitle(),
                            hSize50SizedBox,
                            LandingVector(),
                            hSize50SizedBox,
                            LandingAction(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(0),
                child: termsAndConditions(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
