// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/button_status.dart';
import 'package:shamiri/core/domain/model/user_prefs.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/presentation/controller/user_prefs_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_onboarding/presentation/screens/create_profile_page.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/login_title.dart';

import '../../../../core/domain/model/response_state.dart';
import '../../../../core/presentation/components/show_snackbar.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../feature_main/main_screen.dart';
import '../components/xplore_keyboard.dart';

class PhoneVerifyPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const PhoneVerifyPage(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);

  @override
  _PhoneVerifyPageState createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  TextEditingController otpPinCodeFieldController = new TextEditingController();
  StreamController errorAnimationController = StreamController();
  FocusNode otpPinCodeFocusNode = new FocusNode();
  ButtonStatusStore otpBtnStore = ButtonStatusStore();
  late final AuthController _authController;
  late final UserPrefsController _userPrefsController;
  String? otpCode;
  String? verificationId;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
    _userPrefsController = Get.find<UserPrefsController>();

    verificationId = widget.verificationId;
  }

  @override
  void dispose() {
    super.dispose();
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.admin_panel_settings_rounded,
              color: XploreColors.xploreOrange,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...titles(
                        context: context,
                        extraHeading: 'We sent it to ${widget.phoneNumber}',
                        subtitle: 'to your number.',
                        title: 'Enter code sent \n',
                        canExtraHeading: true),
                    //  pin input field
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Pinput(
                        length: 6,
                        showCursor: true,
                        useNativeKeyboard: false,
                        controller: otpPinCodeFieldController,
                        androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                        defaultPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    XploreColors.xploreOrange.withOpacity(0.3)),
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        onCompleted: (otp) {
                          _authController.verifyOtp(
                              verificationId: verificationId!,
                              userOtp: otp,
                              response: (state, error) {
                                switch (state) {
                                  case ResponseState.success:
                                    _authController.setVerifyOtpLoading(
                                        isLoading: false);
                                    break;
                                  case ResponseState.loading:
                                    _authController.setVerifyOtpLoading(
                                        isLoading: true);
                                    break;
                                  case ResponseState.failure:
                                    _authController.setVerifyOtpLoading(
                                        isLoading: false);

                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      showSnackbar(
                                          title: "Could not verify Otp",
                                          message: error!,
                                          iconData: Icons.onetwothree_rounded,
                                          iconColor: XploreColors.xploreOrange);
                                    });

                                    break;
                                }
                              },
                              onSuccess: (user) async {
                                //  check whether user exists in the database
                                await _authController
                                    .checkUserExists(uid: user.uid)
                                    .then((exists) async {
                                  if (exists) {
                                    //  existing user go to home page
                                    Get.offAll(() => MainScreen());

                                    //  add logged in status to true
                                    await _userPrefsController.updateUserPrefs(
                                        userPrefs: UserPrefs(
                                            isLoggedIn: true,
                                            isProfileCreated: true));
                                  } else {
                                    await _userPrefsController.updateUserPrefs(
                                        userPrefs: UserPrefs(
                                            isLoggedIn: true,
                                            isProfileCreated: false));
                                    //  new user go to info page
                                    Get.offAll(CreateProfilePage());
                                  }
                                });
                              });

                          setState(() {
                            otpCode = otp;
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: OtpTimerButton(
                                  onPressed: () async {
                                    await _authController.signInWithPhone(
                                        phoneNumber:
                                        widget.phoneNumber,
                                        response: (state, error) {
                                          switch (state) {
                                            case ResponseState.success:
                                              _authController
                                                  .setVerifyButtonLoading(
                                                  isLoading: false);
                                              break;
                                            case ResponseState.loading:
                                              _authController
                                                  .setVerifyButtonLoading(
                                                  isLoading: true);
                                              break;
                                            case ResponseState.failure:
                                              _authController
                                                  .setVerifyButtonLoading(
                                                  isLoading: false);

                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                showSnackbar(
                                                    title: "Could not sign in",
                                                    message: error!.toString(),
                                                    iconData: Icons.login_rounded,
                                                    iconColor:
                                                    XploreColors.xploreOrange);
                                              });

                                              break;
                                          }
                                        },
                                        onCodeSent: (verificationId) {
                                          setState(() {
                                            verificationId = verificationId;
                                          });
                                        });
                                  },
                                  text: Text(
                                    "Resend code",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: XploreColors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  height: 55,
                                  backgroundColor: XploreColors.deepBlue,
                                  textColor: XploreColors.white,
                                  duration: 30)),
                          vSize10SizedBox,
                          Text(
                            "Didn't Recieve code?",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: XploreColors.xploreOrange),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //  keyboard
              Expanded(
                  flex: 4,
                  child: Obx(
                    () => XploreKeyboard(
                      controller: otpPinCodeFieldController,
                      isLoading: _authController.isVerifyOtpLoading.value,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
