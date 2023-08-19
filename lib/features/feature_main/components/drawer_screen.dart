import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shamiri/core/presentation/components/profile_pic.dart';
import 'package:shamiri/core/presentation/components/show_toast.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_main/components/drawer_option_item.dart';
import 'package:shamiri/features/feature_main/main_screen.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/screens/merchant_store_page.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/screens/merchant_transactions.dart';

import '../../../application/core/themes/colors.dart';
import 'package:get/get.dart';

import '../../feature_onboarding/presentation/screens/landing_page.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  late final AuthController _authController;
  late final HomeController _homeController;
  late final FToast _toast;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
    _homeController = Get.find<HomeController>();

    _toast = FToast();
    _toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        color: XploreColors.xploreOrange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  profile image
            UnconstrainedBox(
              child: GestureDetector(
                onTap: () {
                  _homeController.setActiveBottomBarIndex(2);
                  ZoomDrawer.of(context)!.close();
                },
                child: ProfilePic(
                  imageUrl: _authController.user.value!.userProfilePicUrl!,
                  imageSize: 100,
                ),
              ),
            ),

            vSize20SizedBox,

            //  user name
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Hello, ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: XploreColors.whiteSmoke,
                      decoration: TextDecoration.none)),
              TextSpan(
                  text: _authController.user.value!.userName!.trimUserName,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: XploreColors.white,
                      decoration: TextDecoration.none,
                      overflow: TextOverflow.ellipsis)),
            ])),

            vSize30SizedBox,

            //  More options
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: XploreColors.deepBlue,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // profile settings
                  DrawerOptionItem(
                      title: "Profile",
                      iconData: Icons.person_rounded,
                      onTap: () {
                        _homeController.setActiveBottomBarIndex(2);
                        ZoomDrawer.of(context)!.close();
                      }),
                  // my store settings
                  DrawerOptionItem(
                      title: "My Store",
                      iconData: Icons.store_rounded,
                      onTap: () {
                        _homeController.setActiveBottomBarIndex(1);
                        ZoomDrawer.of(context)!.close();
                      }),
                  // transactions settings
                  DrawerOptionItem(
                      title: "Transactions",
                      iconData: Icons.receipt_long_rounded,
                      onTap: () {
                        Get.to(() => MerchantTransactions());
                        ZoomDrawer.of(context)!.close();
                      }),
                  // qr code scanner settings
                  DrawerOptionItem(
                      title: "Qr code",
                      iconData: Icons.qr_code_outlined,
                      onTap: () {
                        showToast(
                            toast: _toast,
                            iconData: Icons.access_time_rounded,
                            msg: "Coming soon");
                      }),
                ],
              ),
            ),

            vSize30SizedBox,

            DrawerOptionItem(
                title: "Logout",
                iconData: Icons.logout_rounded,
                onTap: () async {
                  await _authController.signOut();

                  _authController.setUserLoggedIn(isLoggedIn: false);

                  //  navigate back to landing page
                  Get.offAll(() => LandingPage());
                }),
          ],
        ),
      ),
    );
  }
}
