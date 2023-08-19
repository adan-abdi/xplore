import 'package:flutter/cupertino.dart';

class SettingCardModel {
  final String title;
  final IconData iconData;
  final bool isLogout;

  SettingCardModel(
      {required this.title, required this.iconData, this.isLogout = false});
}
