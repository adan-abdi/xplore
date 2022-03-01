import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:xplore/application/core/themes/colors.dart';

class PhoneLoginField extends StatelessWidget {
  final Function onInputChanged;
  final Function onInputValidated;
  final Function onSaved;
  final PhoneNumber number;
  final TextEditingController phoneNumberController;

  const PhoneLoginField(
      {Key? key,
      required this.onInputChanged,
      required this.onInputValidated,
      required this.onSaved,
      required this.number,
      required this.phoneNumberController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
        color: XploreColors.white,
      ),
      child: Container(
        alignment: Alignment.center,
        child: InternationalPhoneNumberInput(
          hintText: '+(254)-700-000-000',
          autoFocus: true,
          inputBorder: InputBorder.none,
          onInputChanged: (PhoneNumber number) => onInputChanged,
          onInputValidated: (bool value) => onInputValidated,
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          initialValue: number,
          textFieldController: phoneNumberController,
          formatInput: false,
          keyboardType: TextInputType.none,
          onSaved: (PhoneNumber number) => onSaved,
        ),
      ),
    );
  }
}
