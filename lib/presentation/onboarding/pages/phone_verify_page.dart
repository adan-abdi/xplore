import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/routes/routes.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/onboarding/widgets/keyboard_scaffold.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_action.dart';
import 'package:xplore/presentation/onboarding/widgets/login_keyboard.dart';
import 'package:xplore/presentation/onboarding/widgets/login_phone_field.dart';
import 'package:xplore/presentation/onboarding/widgets/login_title.dart';

class PhoneVerifyPage extends StatefulWidget {
  const PhoneVerifyPage({Key? key}) : super(key: key);

  @override
  _PhoneVerifyPageState createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();

  String initialCountryCode = 'KE';
  PhoneNumber number = PhoneNumber(isoCode: 'KE');

  String phone = "";
  String isoCode = "";

  @override
  void initState() {
    super.initState();
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
          title: 'Enter code sent \n',
          subtitle: 'to your number.',
          extraHeading: 'We sent it to +(254)-723-073-552.',
        ),
        vSize20SizedBox,
        Form(
          key: _formKey,
          child: PhoneLoginField(
            number: number,
            onInputChanged: () {},
            onInputValidated: () {},
            onSaved: () {},
            phoneNumberController: phoneNumberController,
          ),
        ),
        vSize40SizedBox,
        ActionButton(
          widgetText: nextText,
          isActive: true,
          actionCallback: () {},
        ),
        vSize30SizedBox,
        Container(
          child: LoginKeyboard(
            onKeyTap: (String v) {},
            rightKey: Icon(
              Icons.backspace,
              color: XploreColors.orange,
            ),
            onLeftKeyTap: () {
              StoreProvider.dispatch<AppState>(
                context,
                NavigateAction.pushNamed(otpPageRoute),
              );
            },
          ),
        ),
      ],
    );
  }
}
