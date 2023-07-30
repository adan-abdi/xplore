import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/response_state.dart';
import 'package:shamiri/core/presentation/components/show_snackbar.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/xplore_keyboard.dart';
import 'package:shamiri/features/feature_onboarding/presentation/screens/verify_phone_page.dart';

import '../../../../domain/value_objects/app_spaces.dart';
import 'login_phone_field.dart';
import 'login_title.dart';

class PhoneInputPageContent extends StatefulWidget {
  const PhoneInputPageContent({super.key});

  @override
  State<PhoneInputPageContent> createState() => _PhoneInputPageContentState();
}

class _PhoneInputPageContentState extends State<PhoneInputPageContent> {
  late GlobalKey<FormState>? _formKey;
  late TextEditingController phoneNumberController;
  late AuthController _authController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
    phoneNumberController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      appBar: AppBar(
        backgroundColor: XploreColors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: XploreColors.white,
            systemNavigationBarColor: XploreColors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: XploreColors.black,
            )),
        actions: [
          Icon(
            Icons.admin_panel_settings_rounded,
            color: XploreColors.xploreOrange,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...titles(
                      context: context,
                      extraHeading:
                          'We will send you a confirmation code to verify you.',
                      subtitle: 'mobile number',
                      title: 'Enter your \n',
                    ),

                    vSize40SizedBox,

                    //  phone number input field
                    Form(
                      key: _formKey,
                      child: PhoneLoginField(
                        phoneNumberController: phoneNumberController,
                        onChanged: (String v) {},
                      ),
                    ),

                    vSize40SizedBox,

                    //  verify button
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Obx(
                        () => SubmitButton(
                            iconData: Icons.send_rounded,
                            text: "Verify",
                            isLoading:
                                _authController.isVerifyButtonLoading.value,
                            onTap: () async {
                              if (phoneNumberController.text.length >= 10 &&
                                  (phoneNumberController.text
                                          .startsWith('+254') ||
                                      phoneNumberController.text
                                          .startsWith('07') ||
                                      phoneNumberController.text
                                          .startsWith('7'))) {
                                await _authController.signInWithPhone(
                                    phoneNumber: phoneNumberController.text,
                                    response: (state){
                                      switch (state) {
                                        case ResponseState.success:
                                          _authController.setVerifyButtonLoading(isLoading: false);
                                          break;
                                        case ResponseState.loading:
                                          _authController.setVerifyButtonLoading(isLoading: true);
                                          break;
                                        case ResponseState.failure:
                                          _authController.setVerifyButtonLoading(isLoading: false);
                                          break;
                                      }
                                    },
                                    onCodeSent: (verificationId) {
                                      Get.to(() => PhoneVerifyPage(
                                          verificationId: verificationId,
                                      phoneNumber: phoneNumberController.text,));
                                    });
                              } else {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  showSnackbar(
                                      title: "Invalid Phone Number",
                                      message:
                                          'Please enter a valid phone number',
                                      iconData: Icons.phone_rounded,
                                      iconColor: XploreColors.lightOrange);
                                });
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),

              //  keyboard
              Expanded(
                  flex: 4,
                  child: XploreKeyboard(
                    phoneController: phoneNumberController,
                    isLoading: false,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
