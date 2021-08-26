import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/app_themes.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/onboarding/widgets/circles.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_actions.dart';
import 'package:xplore/presentation/onboarding/widgets/terms_and_conditions.dart';

/// [LandingPage] for XploreApp.
///
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double dimension = 0;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ...circles(context),
            Positioned(
              top: dimension,
              left: dimension,
              right: dimension,
              bottom: dimension,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                            hSize10SizedBox,
                            Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      XploreStrings.landingPageTitle,
                                      textAlign: TextAlign.center,
                                      style: XploreThemes().textThemes(
                                        color: XploreThemes.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    hSize20SizedBox,
                                    Text(
                                      XploreStrings.landingPageSubtitle,
                                      textAlign: TextAlign.center,
                                      style: XploreThemes().textThemes(
                                        color: XploreThemes.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                hSize50SizedBox,
                                LandingActions(),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
