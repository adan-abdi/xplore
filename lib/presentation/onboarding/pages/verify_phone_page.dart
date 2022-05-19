// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:progress_state_button/progress_button.dart';

// Project imports:
import 'package:shamiri/application/core/services/helpers.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/application/singletons/button_status.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';
import 'package:shamiri/presentation/onboarding/widgets/layout/keyboard_scaffold.dart';
import 'package:shamiri/presentation/onboarding/widgets/molecular/buttons/progressive_button.dart';
import 'package:shamiri/presentation/onboarding/widgets/molecular/text/login_title.dart';

class PhoneVerifyPage extends StatefulWidget {
  const PhoneVerifyPage({
    Key? key,
  }) : super(key: key);

  @override
  _PhoneVerifyPageState createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  TextEditingController otpPinCodeFieldController = new TextEditingController();
  StreamController errorAnimationController = StreamController();
  FocusNode otpPinCodeFocusNode = new FocusNode();
  ButtonStatusStore otpBtnStore = ButtonStatusStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var xploreFirebaseAuth = XploreFirebaseAuth();

    return StoreConnector(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState state) {
          return KeyboardScaffold(
            isSecondary: true,
            trailingActionIcon: Icons.textsms,
            keyboardController: otpPinCodeFieldController,
            childWidgets: [
              ...titles(
                context: context,
                title: 'Enter code sent \n',
                subtitle: 'to your number.',
                extraHeading: 'We sent it to ${state.userState!.phoneNumber}',
              ),
              vSize20SizedBox,
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Center(
                  child: Text(
                    "Enter 6 digits code",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: PinCodeTextField(
                    autoFocus: true,
                    focusNode: otpPinCodeFocusNode,
                    useHapticFeedback: true,
                    hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: XploreColors.deepBlue,
                      inactiveColor: XploreColors.orange,
                      inactiveFillColor: XploreColors.white,
                      selectedFillColor: XploreColors.white,
                      errorBorderColor: XploreColors.red,
                      selectedColor: XploreColors.orange,
                    ),
                    cursorColor: XploreColors.orange,
                    keyboardType: TextInputType.none,
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: XploreColors.white,
                    enableActiveFill: true,
                    controller: otpPinCodeFieldController,
                    onCompleted: (v) async {
                      if (otpPinCodeFieldController.text.length >= 6) {
                        otpProgressProgressInstance.btnStatus
                            .add(ButtonState.loading);
                        xploreFirebaseAuth.verifyOtp(
                            otpPinCodeFieldController.text, context, state,
                            isSignedIn: state.userState!.isSignedIn);
                      } else {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            snackbar(
                              content: invalidOTPPrompt,
                              label: okText,
                            ),
                          );
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        otpPinCodeFieldController.text = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                ),
              ),
              vSize20SizedBox,
              ProgressiveButton(
                onPressed: () {
                  if (otpPinCodeFieldController.text.length >= 6) {
                    otpProgressProgressInstance.btnStatus
                        .add(ButtonState.loading);
                    xploreFirebaseAuth.verifyOtp(
                        otpPinCodeFieldController.text, context, state,
                        isSignedIn: state.userState!.isSignedIn);
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        snackbar(
                          content: invalidOTPPrompt,
                          label: okText,
                        ),
                      );
                  }
                },
                progressiveBtnStoreInstance: otpProgressProgressInstance,
              ),
            ],
          );
        });
  }
}
