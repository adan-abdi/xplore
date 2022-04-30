// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/singletons/button_status.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/onboarding/widgets/buttons/action_button.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: LandingPageTitle(),
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.loose,
                child: LandingVector(),
              ),
              Flexible(
                flex: 1,
                child: ActionButton(
                  widgetText: getStartedText,
                  nextRoute: loginPageRoute,
                  colorStream: ButtonStatusStore().landingColorStream,
                  statusStream: ButtonStatusStore().landingStatusStream,
                ),
              ),
            ],
          ),
          trailingWidget: [
            Column(
              children: [
                termsAndConditions(context),
              ],
            ),
          ],
          circleColor: XploreColors.white,
        ));
  }
}
