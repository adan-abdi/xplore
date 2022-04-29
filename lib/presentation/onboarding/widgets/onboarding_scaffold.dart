// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/presentation/onboarding/widgets/layout/circles.dart';
import 'package:xplore/presentation/onboarding/widgets/layout/diagonal_circles.dart';

class OnboardingScaffold extends StatelessWidget {
  final Widget childWidgets;
  final List<Widget> trailingWidget;
  final bool canPop;
  final Color circleColor;

  const OnboardingScaffold({
    Key? key,
    required this.childWidgets,
    required this.circleColor,
    this.trailingWidget = const [SizedBox.shrink()],
    this.canPop = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => canPop,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ...circles(context, circleColor),
            ...diagonalCircles(context, XploreColors.orange),
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: childWidgets,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 40,
                children: trailingWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> defaultOnPop() async {
  return false;
}
