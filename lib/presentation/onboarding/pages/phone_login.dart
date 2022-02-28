import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';

import 'otp_verification_page.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberInputController =
      TextEditingController();
  // late String _phoneNumber;
  // late String _pinCode;

  // late String smsOTP;
  // late String verificationId;
  // String errorMessage = '';

  String initialCountryCode = 'KE';
  PhoneNumber number = PhoneNumber(isoCode: 'KE');

  String phone = "";
  String isoCode = "";

  var num;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                'Enter your phone number to Log In.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.deepOrange),
              ),
                hSize50SizedBox,
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    setState(() {
                      phone = number.phoneNumber!;
                      isoCode = number.isoCode!;
                      num = phone;
                    });
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: _phoneNumberInputController,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    // setState(() {
                    //   phone = number.phoneNumber!;
                    //   isoCode = number.isoCode!;
                    //   num = isoCode + phone;
                    // });
                  },
                ),
                // hSize30SizedBox,
                // TextFormField(
                //   controller: _pinInputController,
                //   onChanged: (String val) {
                //     // _pinCode = val;
                //   },
                //   // PIN
                // ),
                hSize30SizedBox,
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    StoreProvider.dispatch<AppState>(
                      context,
                      NavigateAction.push(MaterialPageRoute(
                          builder: (BuildContext context) => VerificationScreen(
                                mobile: num.substring(2),
                              ))),
                    );
                  },
                  child: const Text(siginText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
