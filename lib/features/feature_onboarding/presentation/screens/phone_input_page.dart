// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/utils/string_extensions.dart';

// Package imports:

// Project imports:
import 'package:shamiri/features/feature_onboarding/presentation/screens/verify_phone_page.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../core/domain/model/response_state.dart';
import '../../../../core/presentation/components/show_snackbar.dart';
import '../../../../core/presentation/components/submit_button.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../../domain/value_objects/app_spaces.dart';
import '../components/login_phone_field.dart';
import '../components/login_title.dart';
import '../components/xplore_keyboard.dart';

class PhoneInputPage extends StatefulWidget {
  const PhoneInputPage({Key? key}) : super(key: key);

  @override
  _PhoneInputPageState createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
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

    phoneNumberController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _authController.setIsPhoneNumberValid(
            isValid: phoneNumberController.text.checkIsPhoneNumberValid);
      });
    });
  }

  @override
  void dispose() {
    phoneNumberController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                          onChanged: (String phone) {},
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
                              isValid: _authController.isPhoneNumberValid.value,
                              onTap: () async {
                                Get.to(() => PhoneVerifyPage(
                                  verificationId: '12345',
                                  phoneNumber:
                                  phoneNumberController.text.add254Prefix,
                                ));
                                // await _authController.signInWithPhone(
                                //     phoneNumber:
                                //         phoneNumberController.text.add254Prefix,
                                //     response: (state, error) {
                                //       switch (state) {
                                //         case ResponseState.success:
                                //           _authController
                                //               .setVerifyButtonLoading(
                                //                   isLoading: false);
                                //           break;
                                //         case ResponseState.loading:
                                //           _authController
                                //               .setVerifyButtonLoading(
                                //                   isLoading: true);
                                //           break;
                                //         case ResponseState.failure:
                                //           _authController
                                //               .setVerifyButtonLoading(
                                //                   isLoading: false);
                                //
                                //           WidgetsBinding.instance
                                //               .addPostFrameCallback((_) {
                                //             showSnackbar(
                                //                 title: "Could not sign in",
                                //                 message: error!.toString(),
                                //                 iconData: Icons.login_rounded,
                                //                 iconColor:
                                //                     XploreColors.xploreOrange);
                                //           });
                                //
                                //           break;
                                //       }
                                //     },
                                //     onCodeSent: (verificationId) {
                                //       Get.to(() => PhoneVerifyPage(
                                //             verificationId: verificationId,
                                //             phoneNumber:
                                //                 phoneNumberController.text.add254Prefix,
                                //           ));
                                //     });
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
                      controller: phoneNumberController,
                      isLoading: false,
                    ))
              ],
            ),
          ),
        ),
      );
}
