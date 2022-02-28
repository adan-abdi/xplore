import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/domain/value_objects/app_strings.dart';
import 'package:xplore/presentation/onboarding/widgets/landing_action.dart';
import 'package:xplore/presentation/onboarding/widgets/login_keyboard.dart';
import 'package:xplore/presentation/onboarding/widgets/login_phone_field.dart';
import 'package:xplore/presentation/onboarding/widgets/login_title.dart';
import 'package:xplore/presentation/onboarding/widgets/profile_scaffold.dart';
import 'package:xplore/presentation/onboarding/widgets/xplore_appbar.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
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
    return ProfileScaffold(
      appbar: XploreAppbar(
        onLeadingtap: () {
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
      ),
      childWidgets: Column(
        children: <Widget>[
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
              number: number,
              onInputChanged: () {},
              onInputValidated: () {},
              onSaved: () {},
              phoneNumberController: phoneNumberController,
            ),
          ),
          vSize30SizedBox,
          ActionButton(
            widgetText: nextText,
          )
        ],
      ),
      trailingWidget: LoginKeyboard(
        onKeyTap: (String v) {},
        rightKey: Icon(
          Icons.backspace,
          color: XploreColors.orange,
          size: 30,
        ),
        leftKey: Icon(
          Icons.done,
          color: XploreColors.orange,
          size: 30,
        ),
      ),
      circleColor: XploreColors.white,
    );
  }
}
