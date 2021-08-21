import 'package:flutter/material.dart';
import 'package:xplore_origin/core/domain/core/value_objects/app_strings.dart';
import 'package:xplore_origin/core/presentation/core/xplore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: XploreOriginStrings.packageName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: XploreAppRoot(),
    );
  }
}
