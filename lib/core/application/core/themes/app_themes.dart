import 'package:flutter/material.dart';
import 'package:xplore_origin/core/domain/core/value_objects/app_magic_numbers.dart';

/// This class holds common themes
class XploreOriginThemes {
  /// Returns a TextStyle
  TextStyle textThemes({
    required Color color,
    double? fontSize,
  }) {
    TextStyle textTheme = TextStyle(
        color: color,
        fontSize: fontSize ?? XploreOriginNumbers.defaultFontSize);

    return textTheme;
  }

  /// [XploreOriginThemes] Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
