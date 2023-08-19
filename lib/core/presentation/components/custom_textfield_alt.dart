import 'package:flutter/material.dart';

import '../../../application/core/themes/colors.dart';

class CustomTextFieldAlt extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final TextStyle textStyle;
  final int? maxLines;
  final bool isObscured;
  final bool isEnabled;
  final bool autoFocusEnabled;
  final bool showLeading;
  final TextEditingController? controller;
  final Function(String text) onChanged;

  const CustomTextFieldAlt({super.key,
    required this.hint,
    required this.iconData,
    required this.textStyle,
    this.maxLines = 1,
    this.isObscured = false,
    this.isEnabled = true,
    this.showLeading = true,
    this.autoFocusEnabled = false,
    required this.controller,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocusEnabled,
      controller: controller,
      enabled: isEnabled,
      obscureText: isObscured,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 18, color: XploreColors.black),
      cursorColor: XploreColors.deepBlue,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: textStyle,
          icon: showLeading ? Icon(
            iconData,
            color: XploreColors.xploreOrange,
          ) : null,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 16),
          filled: true,
          fillColor: XploreColors.whiteSmoke,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none
          )),
      cursorOpacityAnimates: true,
      onChanged: onChanged,
    );
  }
}
