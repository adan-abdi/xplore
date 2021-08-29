import 'package:flutter/material.dart';

class VerifyOTPDialog extends StatefulWidget {
  const VerifyOTPDialog({Key? key}) : super(key: key);

  @override
  _VerifyOTPDialogState createState() => _VerifyOTPDialogState();
}

class _VerifyOTPDialogState extends State<VerifyOTPDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _otpValueController =
  //     TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Container(),
        // todo: Enter Otp input widget ==> _otpValueController.text
        // todo: Handle OTP resend
        // Save button
        // validates formKey
        // Stores SMS Code to state
      ),
    );
  }
}
