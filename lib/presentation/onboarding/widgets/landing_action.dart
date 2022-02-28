import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/routes/routes.dart';

class ActionButton extends StatelessWidget {
  final String widgetText;
  final Color? textColor;
  final Function? actionCallback;
  final bool isActive;

  const ActionButton(
      {Key? key,
      required this.widgetText,
      this.actionCallback,
      this.isActive = false,
      this.textColor})
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
          onPressed: () {
            actionCallback ??
                StoreProvider.dispatch<AppState>(
                  context,
                  NavigateAction.pushNamed(phoneLoginPageRoute),
                );
          },
          child: Text(
            widgetText,
            style: TextStyle(
              color: textColor ?? XploreColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
