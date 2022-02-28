import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Enter your phone number below.',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: XploreColors.black,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
