import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/core/themes/colors.dart';

class ProgressiveButton extends StatelessWidget {
  final Function onPressed;
  final ButtonState buttonState;

  const ProgressiveButton(
      {Key? key, required this.onPressed, this.buttonState = ButtonState.idle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ProgressButton.icon(
          iconedButtons: {
            ButtonState.idle: IconedButton(
              text: "Verify",
              icon: Icon(Icons.send, color: Colors.white),
              color: XploreColors.orange,
            ),
            ButtonState.loading: IconedButton(
              text: "Loading",
              color: XploreColors.deepBlue,
            ),
            ButtonState.fail: IconedButton(
              text: "Failed",
              icon: Icon(Icons.cancel, color: Colors.white),
              color: Colors.red,
            ),
            ButtonState.success: IconedButton(
              text: "Success",
              icon: Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              color: Colors.green.shade400,
            )
          },
          onPressed: onPressed,
          state: phoneLoginProgressInstance.btnStatus.value,
          radius: 5.0,
        ),
      ),
    );
  }
}
