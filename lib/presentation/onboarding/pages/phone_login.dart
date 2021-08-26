import 'package:flutter/material.dart';
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
  final TextEditingController _pinInputController = TextEditingController();
  // late String _phoneNumber;
  // late String _pinCode;

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
                    // _phoneNumber = val;
                  });
                },
              ),
              hSize30SizedBox,
              TextFormField(
                controller: _pinInputController,
                onChanged: (String val) {
                  // _pinCode = val;
                },
                // PIN
              ),
              hSize30SizedBox,
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                ),
                onPressed: () {

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
