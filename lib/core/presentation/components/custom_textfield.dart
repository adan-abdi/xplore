import 'package:flutter/material.dart';

import '../../../application/core/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final TextStyle textStyle;
  final int? maxLines;
  final TextEditingController controller;
  final Function(String text) onChanged;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.iconData,
      required this.textStyle,
      this.maxLines = 1,
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      style: Theme.of(context).textTheme.bodyLarge,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: textStyle,
          icon: Icon(
            iconData,
            color: Theme.of(context).primaryColor,
          ),
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: XploreColors.xploreOrange.withOpacity(0.3),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none)),
      cursorOpacityAnimates: true,
      onChanged: onChanged,
    );
  }
}
