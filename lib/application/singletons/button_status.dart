import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:xplore/domain/value_objects/app_enums.dart';

class ButtonStatusStore {
  factory ButtonStatusStore() {
    return _singleton;
  }

  ButtonStatusStore._internal();
  //Initial
  final colorStream = BehaviorSubject<Color>.seeded(ButtonStatus.init.color);
  final statusStream = BehaviorSubject<bool>.seeded(false);
  //Initial

  static final ButtonStatusStore _singleton = ButtonStatusStore._internal();
}
