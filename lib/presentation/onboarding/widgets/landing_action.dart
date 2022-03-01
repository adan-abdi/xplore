import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';

class ActionButton extends StatelessWidget {
  final String widgetText;
  final Function actionCallback;
  final bool isActive;

  const ActionButton(
      {Key? key,
      required this.widgetText,
      required this.actionCallback,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          style: isActive
              ? ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(XploreColors.orange),
                )
              : ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(XploreColors.white),
                ),
          onPressed: actionCallback(),
          child: Text(
            widgetText,
            style: TextStyle(
              color: isActive ? XploreColors.white : XploreColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
