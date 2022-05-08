// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/presentation/onboarding/widgets/layout/circles.dart';
import 'package:shamiri/presentation/onboarding/widgets/layout/diagonal_circles.dart';

class OnboardingScaffold extends StatelessWidget {
  final Widget childWidgets;
  final Widget trailingWidget;
  final bool canPop;
  final Color circleColor;
  final Color? ringColor1;
  final Color? ringColor2;

  const OnboardingScaffold({
    Key? key,
    required this.childWidgets,
    required this.circleColor,
    this.trailingWidget = const SizedBox.shrink(),
    this.canPop = true,
    this.ringColor1,
    this.ringColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => canPop,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ...circles(context),
            ...diagonalCircles(context),
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              bottom: 30,
              child: childWidgets,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: trailingWidget,
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
