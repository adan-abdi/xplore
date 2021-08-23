import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/app_themes.dart';
import 'package:xplore/domain/core/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/xplore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: XploreOriginStrings.packageName,
      theme: ThemeData(
          primaryColor: XploreThemes.primaryColor,
          accentColor: XploreThemes.accentColor),
      home: XploreAppRoot(),
    );
  }
}
