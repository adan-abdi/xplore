// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/presentation/core/pages/menu_page.dart';
import 'package:shamiri/presentation/dashboard/pages/merchant_checkin.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZoomDrawerController zoomDrawerController = ZoomDrawerController();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: XploreColors.white,
        body: ZoomDrawer(
          controller: zoomDrawerController,
          menuScreen: MenuPage(),
          mainScreen: MerchantCheckIn(),
          borderRadius: 14.0,
          showShadow: true,
          angle: 0.0,
          drawerShadowsBackgroundColor: XploreColors.deepBlueAccent,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
          mainScreenScale: 0.2,
        ),
      ),
    );
  }
}
