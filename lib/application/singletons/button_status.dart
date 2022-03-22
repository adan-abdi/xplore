// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:xplore/domain/value_objects/app_enums.dart';

class ButtonStatusStore {
  factory ButtonStatusStore() {
    return _singleton;
  }

  ButtonStatusStore._internal();
  //Initial
  final colorStream = BehaviorSubject<Color>.seeded(ButtonStatus.init.color);
  final statusStream = BehaviorSubject<bool>.seeded(false);
  //Landing page
  final landingColorStream = BehaviorSubject<Color>.seeded(ButtonStatus.active.color);
  final landingStatusStream = BehaviorSubject<bool>.seeded(true);

  static final ButtonStatusStore _singleton = ButtonStatusStore._internal();
}
