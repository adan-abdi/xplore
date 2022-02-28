import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';

class LandingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrange),
          ),
          onPressed: () {
            StoreProvider.dispatch<AppState>(
              context,
              NavigateAction.pushNamed(phoneLoginPageRoute),
            );
          },
          child: const Text(getStartedText),
        ),
      ),
    );
  }
}
