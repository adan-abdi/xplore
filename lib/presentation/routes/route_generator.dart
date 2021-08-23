import 'package:flutter/material.dart';
import 'package:xplore/presentation/core/xplore.dart';
import 'package:xplore/presentation/routes/routes.dart';

class AppRouterGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    // final dynamic args = settings?.arguments;

    switch (settings?.name) {
      case xploreRootPage:
        return MaterialPageRoute<XploreAppRoot>(
            builder: (_) => XploreAppRoot());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<XploreAppRoot>(
      builder: (_) => const XploreAppRoot(),
    );
  }
}
