import 'package:flutter/material.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              //  user profile card
              Obx(() => UserProfileCard(
                    user: _authController.user.value!,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
