import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_card.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_items.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_page.dart';

class Onboarding extends StatelessWidget {
  List<Color> get colors => pages.map((p) => p.bgColor).toList();

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
            itemBuilder: (index, value) {
              PageData page = pages[index % pages.length];
              return Container(
                child: Theme(
                  data: ThemeData(
                    textTheme: TextTheme(
                      headline6: TextStyle(
                        color: page.textColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Helvetica',
                        letterSpacing: 0.0,
                        fontSize: 17,
                      ),
                      subtitle2: TextStyle(
                        color: page.textColor,
                        fontWeight: FontWeight.w300,
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
                  ScaffoldMessenger.of(context).showSnackBar(snackbar(
                    content: XploreStrings.comingSoonText,
                  ));
                },
                child: const Text(XploreStrings.getStartedText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
