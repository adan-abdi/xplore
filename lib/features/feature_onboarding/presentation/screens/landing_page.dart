// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/button_status.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/onboarding_scaffold.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/action_button.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/landing_title.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/terms_and_conditions.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/landing_vector.dart';

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
                  colorStream: ButtonStatusStore().landingColorStream,
                  statusStream: ButtonStatusStore().landingStatusStream,
                ),
              ),
            ],
          ),
          trailingWidget: termsAndConditions(context),
          circleColor: XploreColors.white,
        ));
  }
}
