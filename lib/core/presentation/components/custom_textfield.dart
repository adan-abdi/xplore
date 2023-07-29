import 'package:flutter/material.dart';

import '../../../application/core/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final TextStyle textStyle;
  final int? maxLines;
  final bool isObscured;
  final bool isEnabled;
  final TextEditingController controller;
  final Function(String text) onChanged;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.iconData,
      required this.textStyle,
      this.maxLines = 1,
      this.isObscured = false,
      this.isEnabled = true,
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
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
          icon: Icon(
            iconData,
            color: XploreColors.xploreOrange,
          ),
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: XploreColors.deepBlue.withOpacity(0.1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none)),
      cursorOpacityAnimates: true,
      onChanged: onChanged,
    );
  }
}
