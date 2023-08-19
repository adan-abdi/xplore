import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/features/feature_profile/presentation/model/setting_card_model.dart';

class SettingCard extends StatelessWidget {
  final SettingCardModel setting;
  final VoidCallback onTap;

  const SettingCard({super.key, required this.setting, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(setting.title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: setting.isLogout ? XploreColors.red : Colors.black)),
      leading: Icon(setting.iconData,
          color:
              setting.isLogout ? XploreColors.red : XploreColors.xploreOrange),
      trailing: SvgPicture.asset(
        'assets/general/arrow.svg',
        width: 24,
        height: 24,
      ),
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: 0.0),
      onTap: onTap,
    );
  }
}
