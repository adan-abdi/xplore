// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:shamiri/application/singletons/button_status.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/phone_input_page_content.dart';

class PhoneInputPage extends StatefulWidget {
  const PhoneInputPage({Key? key}) : super(key: key);

  @override
  _PhoneInputPageState createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  late GlobalKey<FormState>? _formKey;
  late TextEditingController phoneNumberController;
  final ButtonStatusStore actionButtonState = ButtonStatusStore();

  String initialCountryCode = 'KE';

  String phone = "";
  String isoCode = "";
  late bool isValid;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    phoneNumberController.text = '';
    isValid = false;
  }

  @override
  Widget build(BuildContext context) => PhoneInputPageContent();
}
