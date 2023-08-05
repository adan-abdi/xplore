import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_main/components/drawer_option_item.dart';

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

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
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
              child: Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    color: XploreColors.deepBlue,
                    borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:
                      _authController.user.value!.userProfilePicUrl != null &&
                              _authController
                                  .user.value!.userProfilePicUrl!.isNotEmpty
                          ? Image.network(
                              _authController.user.value!.userProfilePicUrl!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.person_rounded, color: XploreColors.white, size: 48,)
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
                  text: _authController.user.value!.userName!,
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
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // profile settings
                  DrawerOptionItem(
                      title: "Profile",
                      iconData: Icons.person_rounded,
                      onTap: () {}),
                  // my store settings
                  DrawerOptionItem(
                      title: "My Store",
                      iconData: Icons.store_rounded,
                      onTap: () {}),
                  // transactions settings
                  DrawerOptionItem(
                      title: "Transactions",
                      iconData: Icons.receipt_long_rounded,
                      onTap: () {}),
                  // qr code scanner settings
                  DrawerOptionItem(
                      title: "Qr code",
                      iconData: Icons.qr_code_outlined,
                      onTap: () {}),
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
