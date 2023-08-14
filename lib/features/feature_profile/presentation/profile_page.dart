import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_profile/presentation/components/user_profile_card.dart';
import 'package:shamiri/presentation/core/pages/user_profile_page.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  user profile card
              Obx(() => UserProfileCard(
                    user: _authController.user.value!,
                  )),

              //  store overview
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.storefront_rounded, color: XploreColors.deepBlue),
                      hSize10SizedBox,
                      Text("Store Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: XploreColors.deepBlue),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
