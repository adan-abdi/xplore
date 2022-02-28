import 'package:async_redux/async_redux.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:xplore/application/redux/actions/update_user_state_action.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_card.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_items.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_page.dart';

class Onboarding extends StatelessWidget {
  List<Color> get colors => pages.map((p) => p.bgColor).toList();

  final PageController pageControl = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConcentricPageView(
            colors: colors,
            radius: 300,
            curve: Curves.ease,
            duration: Duration(seconds: 2),
            pageController: pageControl,
            itemBuilder: (index, value) {
              PageData page = pages[index % pages.length];
              return Container(
                child: Theme(
                  data: ThemeData(
                    textTheme: TextTheme(
                      headline6: TextStyle(
                        color: page.textColor,
                        fontSize: 17,
                      ),
                      subtitle2: TextStyle(
                        color: page.textColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  child: PageCard(page: page),
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            right: 80,
            left: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
                onPressed: () {
                  StoreProvider.dispatch<AppState>(
                      context, UpdateUserStateAction(hasDoneTour: true));

                  StoreProvider.dispatch<AppState>(
                    context,
                    NavigateAction.pushNamed(landingPageRoute),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackbar(
                    content: comingSoonText,
                  ));
                },
                child: const Text(getStartedText),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 5,
            right: 0,
            left: 0,
            child: FloatingActionButton(
              backgroundColor: Colors.orange,
              elevation: 5,
              onPressed: () {
                pageControl.nextPage(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeOutSine,
                );
              },
              child: const Icon(
                Icons.swipe,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
