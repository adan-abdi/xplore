import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';

enum AuthStatus {
  init,
  requiresLogin,
  okay,
}

enum ButtonStatus {
  init, //white
  neutral, //green
  active, //deepBlue
  inactive //red
}

extension ButtonStatusEx on ButtonStatus {
  Color get color {
    switch (this) {
      case ButtonStatus.init:
        return XploreColors.white;
      case ButtonStatus.neutral:
        return XploreColors.green;
      case ButtonStatus.active:
        return XploreColors.deepBlue;
      case ButtonStatus.inactive:
        return XploreColors.red;
    }
  }

  bool get isEnabled {
    switch (this) {
      case ButtonStatus.init:
        return false;
      case ButtonStatus.neutral:
        return false;
      case ButtonStatus.active:
        return true;
      case ButtonStatus.inactive:
        return true;
    }
  }
}
