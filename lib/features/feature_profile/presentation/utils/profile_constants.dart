import 'package:flutter/material.dart';
import 'package:shamiri/features/feature_profile/presentation/model/setting_card_model.dart';

class ProfileConstants {
  static var accountSettings = [
    SettingCardModel(
        title: "Business Information", iconData: Icons.switch_account_rounded),
    SettingCardModel(
        title: "Join our beta", iconData: Icons.bug_report_rounded),
  ];

  static var otherSettings = [
    SettingCardModel(
        title: "Terms of service", iconData: Icons.my_library_books_rounded),
    SettingCardModel(
        title: "Logout", iconData: Icons.logout_rounded, isLogout: true),
  ];
}
