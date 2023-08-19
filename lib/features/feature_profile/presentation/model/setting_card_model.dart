import 'package:flutter/cupertino.dart';

class SettingCardModel {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  SettingCardModel(
      {required this.title, required this.iconData, required this.onTap});
}
