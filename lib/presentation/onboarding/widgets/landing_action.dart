import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/states/app_state.dart';

class ActionButton extends StatelessWidget {
  final String widgetText;
  final String nextRoute;
  final bool isActive;

  const ActionButton({
    Key? key,
    required this.widgetText,
    required this.nextRoute,
    this.isActive = false,
  }) : super(key: key);

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
            StoreProvider.dispatch<AppState>(
              context,
              NavigateAction.pushNamed(nextRoute),
            );
          },
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
