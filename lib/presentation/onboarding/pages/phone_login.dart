// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:progress_state_button/progress_button.dart';

// Project imports:
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/redux/actions/verify_phone_action.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/application/singletons/button_status.dart';
import 'package:xplore/domain/value_objects/app_enums.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/widgets/xplore_snackbar.dart';
import 'package:xplore/presentation/onboarding/widgets/buttons/progressive_button.dart';
import 'package:xplore/presentation/onboarding/widgets/input/login_phone_field.dart';
import 'package:xplore/presentation/onboarding/widgets/layout/keyboard_scaffold.dart';
import 'package:xplore/presentation/onboarding/widgets/login_title.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
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
  Widget build(BuildContext context) {
    return KeyboardScaffold(
      trailingActionIcon: Icons.admin_panel_settings,
      isSecondary: false,
      keyboardController: phoneNumberController,
      childWidgets: [
        ...titles(
          context: context,
          extraHeading: 'We will send you a confirmation code to verify you.',
          subtitle: 'mobile number',
          title: 'Enter your \n',
        ),
        vSize20SizedBox,
        Form(
          key: _formKey,
          child: PhoneLoginField(
            btnStore: actionButtonState,
            phoneNumberController: phoneNumberController,
            onChanged: (String v) {
              setState(() {
                phoneNumberController.text = v;
                if (phoneNumberController.text.length >= 10) {
                  actionButtonState.phoneLoginColorStream
                      .add(ButtonStatus.active.color);
                }
              });
            },
          ),
        ),
        vSize40SizedBox,
        ProgressiveButton(
          onPressed: () {
            if (phoneNumberController.text.length >= 10 &&
                (phoneNumberController.text.startsWith('+254') ||
                    phoneNumberController.text.startsWith('07'))) {
              phoneLoginProgressInstance.btnStatus.add(ButtonState.loading);
              StoreProvider.dispatch<AppState>(
                context,
                VerifyPhoneAction(
                    phoneNumber: phoneNumberController.text, context: context),
              );
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  snackbar(
                    content: invalidPhoneNumberPrompt,
                    label: okText,
                  ),
                );
            }
          },
        ),
      ],
    );
  }
}
