// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/presentation/onboarding/widgets/layout/circles.dart';
import 'package:xplore/presentation/onboarding/widgets/xplore_appbar.dart';

class OnboardingScaffold extends StatelessWidget {
  final Widget childWidgets;
  final List<Widget> trailingWidget;
  final bool canPop;
  final Color circleColor;
  final XploreAppbar? appbar;

  const OnboardingScaffold({
    Key? key,
    required this.childWidgets,
    required this.circleColor,
    this.trailingWidget = const [SizedBox.shrink()],
    this.canPop = true,
    this.appbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => canPop,
      child: Scaffold(
        appBar: appbar,
        body: Stack(
          children: <Widget>[
            ...circles(context, circleColor),
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              bottom: 0,
              child: childWidgets,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 30,
                    runSpacing: 40,
                    children: trailingWidget,
                  ),
                ],
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
