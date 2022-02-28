import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/presentation/onboarding/widgets/login_badge.dart';
import 'package:xplore/presentation/onboarding/widgets/login_keyboard.dart';
import 'package:xplore/presentation/onboarding/widgets/login_phone_field.dart';
import 'package:xplore/presentation/onboarding/widgets/login_title.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_scaffold.dart';

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
    return OnbaordingScaffold(
      childWidgets: Column(
        children: <Widget>[
          hSize40SizedBox,
          LandingBadge(),
          hSize40SizedBox,
          LoginTitle(),
          hSize40SizedBox,
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
          // hSize50SizedBox,
        ],
      ),
      trailingWidget: LoginKeyboard(
        onKeyTap: (String v) {},
        rightKey: Icon(
          Icons.check_circle,
          color: XploreColors.orange,
          size: 30,
        ),
        leftKey: Icon(
          Icons.backspace,
          color: XploreColors.orange,
          size: 30,
        ),
      ),
      circleColor: XploreColors.lightOrange,
    );
  }
}
