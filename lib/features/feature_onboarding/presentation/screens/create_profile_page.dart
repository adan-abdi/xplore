import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/components/show_snackbar.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/presentation/controller/core_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shamiri/features/feature_main/main_screen.dart';

import '../../../../core/domain/model/response_state.dart';
import '../../../../core/domain/model/user_prefs.dart';
import '../../../../core/presentation/components/custom_textfield.dart';
import '../../../../core/presentation/controller/user_prefs_controller.dart';
import '../components/login_title.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _locationController;
  late final CoreController _coreController;
  late final AuthController _authController;
  late final UserPrefsController _userPrefsController;

  @override
  void initState() {
    super.initState();

    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _locationController = TextEditingController();
    _coreController = Get.find<CoreController>();
    _authController = Get.find<AuthController>();
    _userPrefsController = Get.find<UserPrefsController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...titles(
                    context: context,
                    extraHeading: "Let's create your new profile!",
                    subtitle: 'Create Profile',
                    title: 'Welcome! \n',
                  ),
                  vSize40SizedBox,
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: GestureDetector(
                      onTap: () async {
                        await _coreController.pickImage(
                            source: ImageSource.gallery,
                            imageFile: (file) {
                              _coreController.setProfilePic(file: file);
                            });
                      },
                      child: Obx(
                        () => Container(
                          width: 150,
                          height: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: XploreColors.deepBlue,
                          ),
                          child: _coreController.userProfilePic.value != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: Image.file(
                                    File(_coreController
                                        .userProfilePic.value!.path),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                )
                              : SvgPicture.asset(
                                  "assets/general/profile.svg",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      XploreColors.white, BlendMode.srcIn),
                                ),
                        ),
                      ),
                    ),
                  ),
                  vSize40SizedBox,
                  CustomTextField(
                      hint: "Full Name*",
                      iconData: Icons.person_rounded,
                      textStyle: TextStyle(fontSize: 18),
                      controller: _userNameController,
                      onChanged: (value) {}),
                  vSize30SizedBox,
                  CustomTextField(
                      hint: "Email Address*",
                      iconData: Icons.email_rounded,
                      textStyle: TextStyle(fontSize: 18),
                      controller: _emailController,
                      onChanged: (value) {}),
                  vSize30SizedBox,
                  CustomTextField(
                      hint: "Store location (optional)",
                      iconData: Icons.location_on_rounded,
                      textStyle: TextStyle(fontSize: 18),
                      controller: _locationController,
                      onChanged: (value) {}),
                  vSize40SizedBox,
                  Align(
                      alignment: AlignmentDirectional.center,
                      child: Obx(
                        () => SubmitButton(
                            iconData: Icons.done_rounded,
                            text: "Submit",
                            isLoading:
                                _authController.isCreateProfileLoading.value,
                            isValid: false,
                            onTap: () async {
                              await _authController.saveUserDataToFirestore(
                                  userModel: UserModel(
                                      userId: "",
                                      userName: _userNameController.text,
                                      userProfilePicUrl: "",
                                      userEmail: _emailController.text,
                                      userPhoneNumber: "",
                                      createdAt: ""),
                                  userProfilePic:
                                      _coreController.userProfilePic.value,
                                  response: (state, error) {
                                    switch (state) {
                                      case ResponseState.success:
                                        _authController.setCreateProfileLoading(
                                            isLoading: false);
                                        break;
                                      case ResponseState.loading:
                                        _authController.setCreateProfileLoading(
                                            isLoading: true);
                                        break;
                                      case ResponseState.failure:
                                        _authController.setCreateProfileLoading(
                                            isLoading: false);

                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          showSnackbar(
                                              title: "Error Creating Account",
                                              message:
                                                  "Something went wrong. please try again",
                                              iconData: Icons.login_rounded,
                                              iconColor:
                                                  XploreColors.xploreOrange);
                                        });
                                        break;
                                    }
                                  },
                                  onSuccess: () async {
                                    //  navigate to Main Screen
                                    Get.to(() => MainScreen());
                                    //  add logged in status to true
                                    await _userPrefsController.updateUserPrefs(
                                        userPrefs: UserPrefs(
                                            isLoggedIn: true,
                                            isProfileCreated: true));
                                  });
                            }),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
