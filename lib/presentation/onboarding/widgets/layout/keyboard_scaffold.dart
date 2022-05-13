// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:design/src/molecular/xplore_numeric_keyboard.dart';

// Project imports:
import 'package:shamiri/application/core/services/helpers.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/presentation/core/widgets/xplore_small_appbar.dart';
import 'package:shamiri/presentation/onboarding/widgets/layout/circles.dart';
import 'package:shamiri/presentation/onboarding/widgets/layout/diagonal_circles.dart';

class KeyboardScaffold extends StatefulWidget {
  final IconData? trailingActionIcon;
  final List<Widget> childWidgets;
  final Widget? trailingWidget;
  final bool isSecondary;
  final TextEditingController? keyboardController;

  const KeyboardScaffold({
    Key? key,
    required this.childWidgets,
    this.isSecondary = false,
    this.trailingActionIcon = Icons.settings,
    this.trailingWidget,
    this.keyboardController,
  }) : super(key: key);

  @override
  _KeyboardScaffoldState createState() => _KeyboardScaffoldState();
}

class _KeyboardScaffoldState extends State<KeyboardScaffold> {
  var keyController;

  @override
  void initState() {
    keyController = widget.keyboardController ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!widget.isSecondary) {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: XploreSmallAppbar(
          isSecondary: widget.isSecondary,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(widget.trailingActionIcon),
              color: XploreColors.orange,
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            ...circles(context, circleColor: XploreColors.whiteSmoke),
            ...diagonalCircles(context,
                ringColor1: XploreColors.whiteSmoke,
                ringColor2: XploreColors.whiteSmoke),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.childWidgets,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: widget.trailingWidget ??
                  XploreNumericKeyboard(
                    onKeyboardTap: (String text) {
                      setState(() {
                        insertText(text, keyController);
                      });
                    },
                    rightIcon: Icon(
                      Icons.backspace,
                      color: XploreColors.orange,
                    ),
                    rightButtonFn: () {
                      setState(() {
                        backspace(keyController);
                      });
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
