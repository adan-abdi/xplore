// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';

class CustomFAB extends StatelessWidget {
  final IconData actionIcon;
  final String actionLabel;
  final void Function()? onPressed;

  const CustomFAB({
    Key? key,
    required this.actionIcon,
    required this.actionLabel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: XploreColors.deepBlue,
      onPressed: onPressed,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            actionIcon,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Text(actionLabel,
              style: TextStyle(
                fontSize: 14,
              )),
        ],
      ),
      enableFeedback: true,
    );
  }
}
