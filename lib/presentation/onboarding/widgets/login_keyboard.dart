import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:xplore/application/core/themes/colors.dart';

class LoginKeyboard extends StatelessWidget {
  final Function()? onLeftKeyTap;
  final Function(String) onKeyTap;
  final Icon? rightKey;
  final Icon? leftKey;

  const LoginKeyboard({
    Key? key,
    required this.onKeyTap,
    required this.rightKey,
    this.leftKey,
    this.onLeftKeyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: NumericKeyboard(
        textColor: XploreColors.black,
        onKeyboardTap: onKeyTap,
        rightIcon: rightKey,
        leftIcon: leftKey,
        rightButtonFn: onLeftKeyTap,
      ),
    );
  }
}
