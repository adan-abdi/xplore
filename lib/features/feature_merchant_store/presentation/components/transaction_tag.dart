import 'package:flutter/material.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../domain/value_objects/app_spaces.dart';

class TransactionTag extends StatelessWidget {
  final String title;
  final Color tagColor;
  final bool altColors;

  const TransactionTag(
      {super.key, required this.title, required this.tagColor, this.altColors = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
              color: tagColor, borderRadius: BorderRadius.circular(100)),
        ),
        hSize10SizedBox,
        Text(
          title,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.normal, color: altColors ? XploreColors.white :  Colors.black),
        ),
      ],
    );
  }
}
