// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/presentation/onboarding/widgets/layout/circles.dart';

class ProfileScaffold extends StatelessWidget {
  final Widget childWidgets;
  final Widget trailingWidget;
  final bool canPop;
  final Color circleColor;

  const ProfileScaffold({
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
        // appBar: appbar,
        body: Stack(
          children: <Widget>[
            ...circles(context, circleColor),
            childWidgets,
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
