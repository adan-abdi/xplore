// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/button_status.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/login_title.dart';

import '../components/xplore_keyboard.dart';

class PhoneVerifyPage extends StatefulWidget {
  final String verificationId;

  const PhoneVerifyPage({Key? key, required this.verificationId})
      : super(key: key);

  @override
  _PhoneVerifyPageState createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  TextEditingController otpPinCodeFieldController = new TextEditingController();
  StreamController errorAnimationController = StreamController();
  FocusNode otpPinCodeFocusNode = new FocusNode();
  ButtonStatusStore otpBtnStore = ButtonStatusStore();
  String? otpCode;

  @override
  void initState() {
    super.initState();

    print("VERIFICATION ID : ${widget.verificationId}");
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
                'We sent it to ${0717446607}',
                subtitle: 'to your number.',
                title: 'Enter code sent \n',
              ),

              vSize40SizedBox,

              //  pin input field
              Pinput(
                length: 6,
                showCursor: true,
                controller: otpPinCodeFieldController,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: XploreColors.xploreOrange.withOpacity(0.3)
                  ),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                ),
                onSubmitted: (value){
                  setState(() {
                    otpCode = value;
                  });
                },
              ),

              vSize40SizedBox,

              //  keyboard
              Expanded(
                  child: XploreKeyboard(
                    phoneController: otpPinCodeFieldController,
                  ))
            ],
          ),
        ),
      ),
    );

    // return StoreConnector(
    //     converter: (Store<AppState> store) => store.state,
    //     builder: (BuildContext context, AppState state) {
    //       return KeyboardScaffold(
    //         isSecondary: true,
    //         trailingActionIcon: Icons.textsms,
    //         keyboardController: otpPinCodeFieldController,
    //         childWidgets: [
    //           ...titles(
    //             context: context,
    //             title: 'Enter code sent \n',
    //             subtitle: 'to your number.',
    //             extraHeading: 'We sent it to ${state.userState!.phoneNumber}',
    //           ),
    //           vSize20SizedBox,
    //           Padding(
    //             padding: EdgeInsets.only(bottom: 16),
    //             child: Center(
    //               child: Text(
    //                 "Enter 6 digits code",
    //                 style: TextStyle(
    //                   color: Colors.deepOrange,
    //                   fontSize: 12,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Container(
    //             width: double.infinity,
    //             child: Container(
    //               alignment: Alignment.center,
    //               padding: const EdgeInsets.symmetric(horizontal: 30),
    //               width: MediaQuery.of(context).size.width * 0.60,
    //               child: PinCodeTextField(
    //                 autoFocus: true,
    //                 focusNode: otpPinCodeFocusNode,
    //                 useHapticFeedback: true,
    //                 hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
    //                 length: 6,
    //                 obscureText: false,
    //                 animationType: AnimationType.scale,
    //                 pinTheme: PinTheme(
    //                   shape: PinCodeFieldShape.circle,
    //                   borderRadius: BorderRadius.circular(10),
    //                   fieldHeight: 50,
    //                   fieldWidth: 40,
    //                   activeFillColor: Colors.white,
    //                   activeColor: XploreColors.deepBlue,
    //                   inactiveColor: XploreColors.orange,
    //                   inactiveFillColor: XploreColors.white,
    //                   selectedFillColor: XploreColors.white,
    //                   errorBorderColor: XploreColors.red,
    //                   selectedColor: XploreColors.orange,
    //                 ),
    //                 cursorColor: XploreColors.orange,
    //                 keyboardType: TextInputType.none,
    //                 animationDuration: Duration(milliseconds: 300),
    //                 backgroundColor: XploreColors.white,
    //                 enableActiveFill: true,
    //                 controller: otpPinCodeFieldController,
    //                 onCompleted: (v) async {
    //                   if (otpPinCodeFieldController.text.length >= 6) {
    //                     otpProgressProgressInstance.btnStatus
    //                         .add(ButtonState.loading);
    //                     xploreFirebaseAuth.verifyOtp(
    //                         otpPinCodeFieldController.text, context, state,
    //                         isSignedIn: state.userState!.isSignedIn);
    //                   } else {
    //                     ScaffoldMessenger.of(context)
    //                       ..hideCurrentSnackBar()
    //                       ..showSnackBar(
    //                         snackbar(
    //                           content: invalidOTPPrompt,
    //                           label: okText,
    //                         ),
    //                       );
    //                   }
    //                 },
    //                 onChanged: (value) {
    //                   setState(() {
    //                     otpPinCodeFieldController.text = value;
    //                   });
    //                 },
    //                 beforeTextPaste: (text) {
    //                   print("Allowing to paste $text");
    //                   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
    //                   //but you can show anything you want here, like your pop up saying wrong paste format or etc
    //                   return true;
    //                 },
    //                 appContext: context,
    //               ),
    //             ),
    //           ),
    //           vSize20SizedBox,
    //           ProgressiveButton(
    //             onPressed: () {
    //               if (otpPinCodeFieldController.text.length >= 6) {
    //                 otpProgressProgressInstance.btnStatus
    //                     .add(ButtonState.loading);
    //                 xploreFirebaseAuth.verifyOtp(
    //                     otpPinCodeFieldController.text, context, state,
    //                     isSignedIn: state.userState!.isSignedIn);
    //               } else {
    //                 ScaffoldMessenger.of(context)
    //                   ..hideCurrentSnackBar()
    //                   ..showSnackBar(
    //                     snackbar(
    //                       content: invalidOTPPrompt,
    //                       label: okText,
    //                     ),
    //                   );
    //               }
    //             },
    //             progressiveBtnStoreInstance: otpProgressProgressInstance,
    //           ),
    //         ],
    //       );
    //     });
  }
}
