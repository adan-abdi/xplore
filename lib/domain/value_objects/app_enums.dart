// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';

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

enum TransactionStatus {
  fulfilled,
  pending,
}

extension OrderStatusExtension on TransactionStatus {
  String get name {
    switch (this) {
      case TransactionStatus.fulfilled:
        return 'fulfilled';
      case TransactionStatus.pending:
        return 'pending';
      default:
        return 'pending';
    }
  }
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

enum UserStatus { hasDoneTour, signedIn }

extension UserStatusEx on UserStatus {
  bool get status {
    switch (this) {
      case UserStatus.hasDoneTour:
        return true;
      case UserStatus.signedIn:
        return true;
    }
  }
}

enum ProductListingStates { error, empty, dataGrid, dataList, search, shimmer }
