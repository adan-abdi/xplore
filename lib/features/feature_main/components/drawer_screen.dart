import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          : SvgPicture.asset(
                              "assets/general/profile.svg",
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  XploreColors.white, BlendMode.srcIn),
                            ),
                ),
              ),
            ),

            //  logout button
            GestureDetector(
              onTap: () async {
                await _authController.signOut();

                _authController.setUserLoggedIn(isLoggedIn: false);

                //  navigate back to landing page
                Get.offAll(() => LandingPage());
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: XploreColors.deepBlue,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: XploreColors.whiteSmoke),
                    hSize20SizedBox,
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: XploreColors.white,
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
