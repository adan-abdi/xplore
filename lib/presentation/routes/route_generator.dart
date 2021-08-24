import 'package:flutter/material.dart';
import 'package:xplore/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:xplore/presentation/core/xplore_root.dart';

class AppRouterGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    // final dynamic args = settings?.arguments;

    switch (settings?.name) {
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<XploreAppRoot>(
      builder: (_) => const UnrecoverableErrorWidget(),
    );
  }
}
