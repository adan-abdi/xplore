// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/singletons/button_status.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/onboarding/widgets/action_button.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_title.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_vector.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_scaffold.dart';
import 'package:xplore/presentation/onboarding/widgets/terms_and_conditions.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: OnboardingScaffold(
          childWidgets: Column(
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
                        nextRoute: phoneLoginPageRoute,
                        colorStream: ButtonStatusStore().colorStream,
                        statusStream: ButtonStatusStore().statusStream,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          trailingWidget: [termsAndConditions(context)],
          circleColor: XploreColors.orange,
        ));
  }
}
