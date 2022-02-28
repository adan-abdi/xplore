import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/presentation/onboarding/widgets/circles.dart';

class OnbaordingScaffold extends StatelessWidget {
  final Widget childWidgets;
  final Widget trailingWidget;
  final bool canPop;
  final Color circleColor;

  const OnbaordingScaffold({
    Key? key,
    required this.childWidgets,
    this.trailingWidget = const SizedBox.shrink(),
    this.canPop = true,
    required this.circleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => canPop,
      child: Scaffold(
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
              child: Container(
                child: trailingWidget,
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
