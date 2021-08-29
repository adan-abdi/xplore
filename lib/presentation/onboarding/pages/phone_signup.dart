import 'package:flutter/material.dart';
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberInputController =
      TextEditingController();
  final TextEditingController _initialPinInputController =
      TextEditingController();
  final TextEditingController _confirmPinInputController =
      TextEditingController();
  String? _phoneNumber;
  String? _initialPinCode;
  String? _confirmPinCode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              hSize50SizedBox,
              TextFormField(
                controller: _phoneNumberInputController,
                // Phone Number field + Country Code ()
                onChanged: (String val) {
                  setState(() {
                    _phoneNumber = val;
                  });
                },
              ),
              hSize30SizedBox,
              TextFormField(
                controller: _initialPinInputController,
                onChanged: (String val) {
                  _initialPinCode = val;
                },
                // PIN
              ),
              hSize30SizedBox,
              TextFormField(
                controller: _confirmPinInputController,
                onChanged: (String val) {
                  _confirmPinCode = val;
                },
                // PIN
              ),
              hSize30SizedBox,
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: (_phoneNumber == null ||
                          _initialPinCode == null ||
                          _confirmPinCode == null)
                      ? MaterialStateProperty.all<Color>(Colors.grey)
                      : MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  signUp(
                    confirmPin: _confirmPinInputController.text,
                    context: context,
                    formKey: _formKey,
                    phoneNumber: _phoneNumberInputController.text,
                    pin: _initialPinInputController.text,
                  );
                },
                child: const Text(siginText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
