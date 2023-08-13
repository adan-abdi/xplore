import 'package:flutter/material.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../application/core/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final TextStyle textStyle;
  final int? maxLines;
  final bool isObscured;
  final bool isEnabled;
  final bool? showErrorMessage;
  final String? errorMessage;
  final String? value;
  final TextInputType inputType;
  final TextEditingController? controller;
  final Function(String text) onChanged;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.iconData,
      required this.textStyle,
      this.maxLines = 1,
      this.isObscured = false,
      this.isEnabled = true,
      this.showErrorMessage,
      this.errorMessage,
      this.value,
      this.inputType = TextInputType.text,
      this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofocus: false,
          controller: controller,
          enabled: isEnabled,
          obscureText: isObscured,
          keyboardType: inputType,
          maxLines: maxLines,
          textInputAction: TextInputAction.done,
          style: TextStyle(fontSize: 18, color: XploreColors.black),
          cursorColor: XploreColors.deepBlue,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: textStyle,
              icon: Icon(
                iconData,
                color: XploreColors.xploreOrange,
              ),
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: XploreColors.white,
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: XploreColors.xploreOrange)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: XploreColors.deepBlue.withOpacity(0.1))),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: XploreColors.deepBlue.withOpacity(0.1)))),
          cursorOpacityAnimates: true,
          onChanged: onChanged,
        ),

        vSize20SizedBox,

        //  error message
        Visibility(
            visible: showErrorMessage != null && showErrorMessage! == true ,
            child: Row(
              children: [
                Icon(Icons.error_rounded, color: XploreColors.red, size: 16,),
                hSize10SizedBox,
                Text(
                  errorMessage ?? "",
                  style: TextStyle(fontSize: 16, color: XploreColors.red),
                )
              ],
            ))
      ],
    );
  }
}
