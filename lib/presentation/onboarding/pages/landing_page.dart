import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_action.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_vector.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_title.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_scaffold.dart';
import 'package:xplore/presentation/onboarding/widgets/terms_and_conditions.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: OnbaordingScaffold(
          childWidgets: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                      vSize50SizedBox,
                      LandingVector(),
                      vSize50SizedBox,
                      ActionButton(
                        widgetText: getStartedText,
                        textColor: XploreColors.white,
                        isActive: true,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          trailingWidget: termsAndConditions(context),
          circleColor: XploreColors.orange,
        ));
  }
}
