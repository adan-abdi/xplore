import 'package:flutter/material.dart';
import 'package:xplore_origin/domain/core/value_objects/app_magic_numbers.dart';

/// This class holds common themes
class XploreThemes {
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

  /// [XploreThemes] Colors
  static const Color primaryColor = Color(0xFFF57C00);
  // todo: Should be a different color than orange
  static const Color secondaryColor = Color(0xFFF57C00);
  static const Color accentColor = Color(0xFFFFAB40);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
