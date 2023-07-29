// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:progress_state_button/progress_button.dart';

// Project imports:
import 'package:shamiri/application/core/services/helpers.dart';
import 'package:shamiri/application/redux/actions/verify_phone_action.dart';
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/application/singletons/button_status.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/phone_input_page_content.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/keyboard_scaffold.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/progressive_button.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/login_phone_field.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/login_title.dart';

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
