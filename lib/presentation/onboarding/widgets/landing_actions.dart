import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';

class LandingActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            onPressed: () {
              StoreProvider.dispatch<AppState>(
                    context,
                    NavigateAction.pushNamed(siginPageRoute),
                  );
            },
            child: const Text(siginText),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            onPressed: () {
              StoreProvider.dispatch<AppState>(
                    context,
                    NavigateAction.pushNamed(sigupPageRoute),
                  );
            },
            child: const Text(signupText),
          ),
        ),
      ],
    );
  }
}
