// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// Project imports:
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/actions/verify_phone_action.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/application/singletons/button_status.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_enums.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/core/pages/xplore_numeric_keyboard.dart';
import 'package:xplore/presentation/onboarding/widgets/buttons/action_button.dart';
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
  PhoneNumber number = PhoneNumber(isoCode: 'KE');

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
            Icons.admin_panel_settings,
            color: XploreColors.orange,
          ),
        ),
        hSize30SizedBox
      ],
      widgets: [
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
        ActionButton(
          widgetText: nextText,
          nextRoute: otpPageRoute,
          statusStream: actionButtonState.phoneLoginStatusStream,
          colorStream: actionButtonState.phoneLoginColorStream,
          onTapCallback: () {
            if (phoneNumberController.text.length >= 10 &&
                (phoneNumberController.text.startsWith('+254') ||
                    phoneNumberController.text.startsWith('07'))) {
              actionButtonState.phoneLoginColorStream
                  .add(ButtonStatus.active.color);
              actionButtonState.phoneLoginStatusStream.add(true);

              StoreProvider.dispatch<AppState>(
                context,
                VerifyPhoneAction(
                    phoneNumber: phoneNumberController.text, context: context),
              );
            }
          },
        ),
        vSize30SizedBox,
        Container(
          width: double.infinity,
          child: XploreNumericKeyboard(
            onKeyboardTap: (String text) {
              setState(() {
                insertText(text, phoneNumberController);
              });
            },
            rightIcon: Icon(
              Icons.backspace,
              color: XploreColors.orange,
            ),
            rightButtonFn: () {
              setState(() {
                backspace(phoneNumberController);
              });
            },
          ),
        ),
      ],
    );
  }
}
