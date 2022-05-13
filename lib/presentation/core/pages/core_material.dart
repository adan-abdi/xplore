import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/presentation/core/pages/main_drawer.dart';

class XploreDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: XploreColors.deepBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainDrawer(),
    );
  }
}