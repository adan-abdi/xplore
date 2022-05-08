// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/domain/value_objects/app_magic_numbers.dart';

/// This class holds common themes
class XploreThemes {
  /// Returns a TextStyle
  TextStyle textThemes(
      {required Color color, double? fontSize, FontWeight? fontWeight}) {
    TextStyle textTheme = TextStyle(
        color: color,
        fontSize: fontSize ?? defaultFontSize,
        fontWeight: fontWeight ?? FontWeight.normal);

    return textTheme;
  }

  /// [XploreThemes] Colors
  static const Color primaryColor = Color(0xFFF57C00);
  // todo: Should be a different color than orange
  static const Color secondaryColor = Color(0xFFF57C00);
  static const Color accentColor = Color(0xFFFFAB40);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xff828282);
}
