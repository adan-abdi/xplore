import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/progressive_button.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/xplore_keyboard.dart';
import 'package:shamiri/features/feature_onboarding/presentation/screens/verify_phone_page.dart';

import '../../../../application/core/services/helpers.dart';
import '../../../../application/redux/actions/verify_phone_action.dart';
import '../../../../application/redux/states/app_state.dart';
import '../../../../domain/value_objects/app_spaces.dart';
import '../../../../domain/value_objects/app_strings.dart';
import '../../../../presentation/core/widgets/xplore_snackbar.dart';
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
                  onChanged: (String v) {
                    // setState(() {
                    //   phoneNumberController.text = v;
                    //   if (phoneNumberController.text.length >= 10) {
                    //     actionButtonState.phoneLoginColorStream
                    //         .add(ButtonStatus.active.color);
                    //   }
                    // });
                  },
                ),
              ),

              vSize40SizedBox,

              //  verify button
              ProgressiveButton(
                onPressed: () {
                  if (phoneNumberController.text.length >= 10 &&
                      (phoneNumberController.text.startsWith('+254') ||
                          phoneNumberController.text.startsWith('07') ||
                          phoneNumberController.text.startsWith('7'))) {
                    _authController.signInWithPhone(
                        phoneNumber: phoneNumberController.text,
                        onCodeSent: (verificationId) {
                          Get.to(() =>
                              PhoneVerifyPage(verificationId: verificationId));
                        });

                    // phoneLoginProgressInstance.btnStatus.add(ButtonState.loading);
                    // StoreProvider.dispatch<AppState>(
                    //   context,
                    //   VerifyPhoneAction(
                    //       phoneNumber: phoneNumberController.text,
                    //       context: context),
                    // );
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        snackbar(
                          content: invalidPhoneNumberPrompt,
                          label: okText,
                        ),
                      );
                  }
                },
                progressiveBtnStoreInstance: phoneLoginProgressInstance,
              ),

              vSize40SizedBox,

              //  keyboard
              Expanded(
                  child: XploreKeyboard(
                phoneController: phoneNumberController,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
