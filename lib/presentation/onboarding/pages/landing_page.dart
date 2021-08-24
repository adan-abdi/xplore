import 'package:flutter/material.dart';
import 'package:xplore/presentation/onboarding/widgets/circles.dart';
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
                            // smallVerticalSizedBox,
                            Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "landingPageTitle",
                                      textAlign: TextAlign.center,
                                      // style:
                                      //     TextThemes.heavySize24Text().copyWith(
                                      //   color: Theme.of(context).primaryColor,
                                      // ),
                                    ),
                                    // mediumVerticalSizedBox,
                                    Text(
                                      "landingPageSubtitle",
                                      textAlign: TextAlign.center,
                                      // style:
                                      //     TextThemes.boldSize18Text().copyWith(
                                      //   color: greyTextColor,
                                      // ),
                                    ),
                                  ],
                                ),
                                // veryLargeVerticalSizedBox,
                                // LandingActions(),
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
              // key: AppWidgetKeys.termsAndConditionsKey,
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(0),
                child: termsAndConditions(context),
              ),
            ),
            // Positioned(
            //   top: 40,
            //   left: 20,
            //   child: BewellLogo(),
            // ),
          ],
        ),
      ),
    );
  }
}
