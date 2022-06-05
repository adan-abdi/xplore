// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/presentation/core/pages/dashboard.dart';
import 'package:shamiri/presentation/core/pages/user_profile_page.dart';
import 'package:shamiri/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:shamiri/presentation/dashboard/pages/add_product_page.dart';
import 'package:shamiri/presentation/dashboard/pages/edit_product_page.dart';
import 'package:shamiri/presentation/onboarding/pages/landing_page.dart';
import 'package:shamiri/presentation/onboarding/pages/phone_input_page.dart';
import 'package:shamiri/presentation/onboarding/pages/verify_phone_page.dart';
import 'package:shamiri/xplore_app.dart';

class AppRouterGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final dynamic args = settings?.arguments;

    switch (settings?.name) {
      //
      case landingPageRoute:
        return MaterialPageRoute<LandingPage>(builder: (_) => LandingPage());
      //
      case phoneInputPageRoute:
        return MaterialPageRoute<PhoneInputPage>(
            builder: (_) => PhoneInputPage());
      case verifyPhonePageRoute:
        return MaterialPageRoute<PhoneVerifyPage>(
            builder: (_) => PhoneVerifyPage());
      //
      case dashPageRoute:
        return MaterialPageRoute<XploreDashboard>(
            builder: (_) => XploreDashboard());
      case addProductPageRoute:
        return MaterialPageRoute<AddProductPage>(
            builder: (_) => AddProductPage(
                  productRepoInstance: args,
                ));
      case editProductPageRoute:
        return MaterialPageRoute<EditProducts>(
            builder: (_) => EditProducts(
                  product: args,
                ));
      case profilePageRoute:
        return MaterialPageRoute<UserProfilePage>(
            builder: (_) => UserProfilePage());

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
