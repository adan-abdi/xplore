// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// Project imports:
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/application/singletons/button_status.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/pages/xplore_numeric_keyboard.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';
import 'package:xplore/presentation/onboarding/widgets/action_button.dart';
import 'package:xplore/presentation/onboarding/widgets/keyboard_scaffold.dart';
import 'package:xplore/presentation/onboarding/widgets/login_title.dart';

class PhoneVerifyPage extends StatefulWidget {
  final String? mobile;
  const PhoneVerifyPage({Key? key, this.mobile}) : super(key: key);

  @override
  _PhoneVerifyPageState createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  TextEditingController otpPinCodeFieldController = new TextEditingController();
  StreamController errorAnimationController = StreamController();
  FocusNode otpPinCodeFocusNode = new FocusNode();
  ButtonStatusStore otpBtnStore = ButtonStatusStore();

  String otp = "";
  bool isLoading = false;
  late String _verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String initialCountryCode = 'KE';
  PhoneNumber number = PhoneNumber(isoCode: 'KE');

  String phone = "";
  String isoCode = "";

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  void _signInWithPhoneNumber(String otp) async {
    _showProgressDialog(true);
    if (await checkInternet()) {
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: otp,
        );
        final User? user = (await _auth.signInWithCredential(credential)).user;
        final User? currentUser = _auth.currentUser;
        assert(user!.uid == currentUser!.uid);

        _showProgressDialog(false);
        if (user != null) {
          print(user);
          StoreProvider.dispatch<AppState>(
            context,
            NavigateAction.pushNamed(dashPageRoute),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(snackbar(
            content: "Sign In Failed",
          ));
        }
      } catch (e) {
        print(e);

        ScaffoldMessenger.of(context).showSnackBar(snackbar(
          content: e.toString(),
        ));
        _showProgressDialog(false);
      }
    } else {
      _showProgressDialog(false);
      ScaffoldMessenger.of(context).showSnackBar(snackbar(
        content: "No Internet Connection!",
      ));
    }
  }

  _showProgressDialog(bool isloadingstate) {
    if (mounted)
      setState(() {
        isLoading = isloadingstate;
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  verifyOtp(String otpText) async {
    // if (otpText != null) {
    // setState(() {
    //   otpBtnStore.colorStream.add(ButtonStatus.active.color);
    // });
    _signInWithPhoneNumber(otpText);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardScaffold(
      onLeadingTap: () {
        StoreProvider.dispatch<AppState>(
          context,
          NavigateAction.pop(),
        );
      },
      actions: [
        InkWell(
          key: ValueKey('XploreAppbar_action1'),
          onTap: () {},
          child: Icon(
            Icons.textsms,
            color: XploreColors.orange,
          ),
        ),
        hSize30SizedBox
      ],
      widgets: [
        ...titles(
          context: context,
          title: 'Enter code sent \n',
          subtitle: 'to your number.',
          extraHeading: 'We sent it to +(254)-723-073-552.',
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
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                inactiveColor: XploreColors.white,
                selectedFillColor: XploreColors.white,
                errorBorderColor: XploreColors.red,
                selectedColor: XploreColors.orange
              ),
              cursorColor: XploreColors.orange,
              keyboardType: TextInputType.none,
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: XploreColors.white,
              enableActiveFill: true,
              // errorAnimationController: errorAnimationController,
              controller: otpPinCodeFieldController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
                setState(() {
                  // currentText = value;
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
        ActionButton(
          widgetText: nextText,
          nextRoute: dashPageRoute,
          colorStream: ButtonStatusStore().colorStream,
          statusStream: ButtonStatusStore().statusStream,
        ),
        vSize30SizedBox,
        Container(
          child: XploreNumericKeyboard(
            onKeyboardTap: (String text) {
              setState(() {
                insertText(text, otpPinCodeFieldController);
              });
            },
            rightIcon: Icon(
              Icons.backspace,
              color: XploreColors.orange,
            ),
            rightButtonFn: () {
              setState(() {
                backspace(otpPinCodeFieldController);
              });
            },
          ),
        ),
      ],
    );
  }

  void _verifyPhoneNumber() async {
    if (mounted)
      setState(() {
        isLoading = true;
      });

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      ScaffoldMessenger.of(context).showSnackBar(snackbar(
        // content: "An Error Occured",
        content: authException.message,
      ));
      print(authException.code);
      print(authException.message);
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      print("codeSent");
      print(verificationId);
      ScaffoldMessenger.of(context).showSnackBar(snackbar(
        content:
            "Please check your phone for the verification code ${verificationId}.",
      ));
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("codeAutoRetrievalTimeout");
      _verificationId = verificationId;
    };

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      print("verificationCompleted");
    };

    if (kIsWeb) {
      await _auth
          .signInWithPhoneNumber(
        widget.mobile ?? '',
      )
          .then((value) {
        _verificationId = value.verificationId;
        print("then");
      }).catchError((onError) {
        print(onError);
      });
    } else {
      await _auth
          .verifyPhoneNumber(
              phoneNumber: widget.mobile ?? '',
              timeout: const Duration(seconds: 15),
              verificationCompleted: verificationCompleted,
              verificationFailed: verificationFailed,
              codeSent: codeSent,
              codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
          .then((value) {
        print("then");
      }).catchError((onError) {
        print(onError);
      });
    }

    if (mounted)
      setState(() {
        isLoading = false;
      });
  }

  _onButtonClick() {
    if (otpPinCodeFieldController.text.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(snackbar(
        content: "Please enter valid verification code.",
      ));
    } else {
      verifyOtp(otpPinCodeFieldController.text.trim());
    }
  }

  static Widget progress(BuildContext context, {Color? color}) {
    return Container(
      alignment: Alignment.center,
      color: color != null ? color : Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: LinearProgressIndicator(
            backgroundColor: Colors.deepOrange.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
          ),
        ),
      ),
    );
  }
}
