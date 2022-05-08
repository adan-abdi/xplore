// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:progress_state_button/progress_button.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:shamiri/domain/value_objects/app_enums.dart';

class ButtonStatusStore {
  factory ButtonStatusStore() {
    return _singleton;
  }

  ButtonStatusStore._internal();
  //Initial
  final colorStream = BehaviorSubject<Color>.seeded(ButtonStatus.init.color);
  final statusStream = BehaviorSubject<bool>.seeded(false);

  //Landing page
  final landingColorStream =
      BehaviorSubject<Color>.seeded(ButtonStatus.active.color);
  final landingStatusStream = BehaviorSubject<bool>.seeded(true);

  //Phone login page
  final phoneLoginColorStream =
      BehaviorSubject<Color>.seeded(ButtonStatus.init.color);
  final phoneLoginStatusStream = BehaviorSubject<bool>.seeded(false);

  static final ButtonStatusStore _singleton = ButtonStatusStore._internal();
}

class LoginProgressBtnStore {
  factory LoginProgressBtnStore() {
    return _singleton;
  }

  LoginProgressBtnStore._internal();

  final btnStatus = BehaviorSubject<ButtonState>.seeded(ButtonState.idle);

  static final LoginProgressBtnStore _singleton =
      LoginProgressBtnStore._internal();
}

class VerifyProgressBtnStore {
  factory VerifyProgressBtnStore() {
    return _singleton;
  }

  VerifyProgressBtnStore._internal();

  final btnStatus = BehaviorSubject<ButtonState>.seeded(ButtonState.idle);

  static final VerifyProgressBtnStore _singleton =
      VerifyProgressBtnStore._internal();
}
