import 'package:flutter/material.dart';
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';

class PhoneSignUp extends StatefulWidget {
  const PhoneSignUp({Key? key}) : super(key: key);

  @override
  _PhoneSignUpState createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberInputController =
      TextEditingController();

  bool areTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                hSize50SizedBox,
                TextFormField(
                  controller: _phoneNumberInputController,
                  // Phone Number field + Country Code ()
                  onChanged: (String val) {
                    setState(() {});
                  },
                ),
                hSize30SizedBox,
                // todo: terms and conditions checkbox
                hSize30SizedBox,
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: (areTermsAccepted != false)
                        ? MaterialStateProperty.all<Color>(Colors.grey)
                        : MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    signUp(
                      context: context,
                      phoneNumber: _phoneNumberInputController.text,
                      areTermsAccepted: areTermsAccepted,
                      formKey: _formKey,
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
