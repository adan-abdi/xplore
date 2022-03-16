// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:xplore/presentation/dashboard/pages/Base.dart';
import 'package:xplore/presentation/dashboard/pages/Profile.dart';
import 'package:xplore/presentation/onboarding/pages/landing_page.dart';
import 'package:xplore/presentation/onboarding/pages/phone_login.dart';
import 'package:xplore/presentation/onboarding/pages/phone_verify_page.dart';
import 'package:xplore/xplore_app.dart';

class AppRouterGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    // final dynamic args = settings?.arguments;

    switch (settings?.name) {
      case landingPageRoute:
        return MaterialPageRoute<LandingPage>(builder: (_) => LandingPage());
      case phoneLoginPageRoute:
        return MaterialPageRoute<PhoneLogin>(builder: (_) => PhoneLogin());
      case dashPageRoute:
        return MaterialPageRoute<Base>(builder: (_) => Base());
      case profRoute:
        return MaterialPageRoute<Profile>(builder: (_) => Profile());
      case otpPageRoute:
        return MaterialPageRoute<Profile>(
            builder: (_) => PhoneVerifyPage(
                  mobile: '',
                ));
      case loginPageRoute:
        return MaterialPageRoute<Scaffold>(
            builder: (_) => Scaffold(
                  body: Container(
                    child: Center(
                      child: const Text(
                          'This is the **LoginPage**, it it not yet done'),
                    ),
                  ),
                ));

      case homePageRoute:
        return MaterialPageRoute<Scaffold>(
            builder: (_) => Scaffold(
                  body: Container(
                    child: Center(
                      child: const Text(
                          'This is the **Homepage**, it it not yet done'),
                    ),
                  ),
                ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<XploreApp>(
      builder: (_) => const UnrecoverableErrorWidget(),
    );
  }
}