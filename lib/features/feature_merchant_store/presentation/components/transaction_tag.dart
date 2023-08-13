import 'package:flutter/material.dart';

import '../../../../domain/value_objects/app_spaces.dart';

class TransactionTag extends StatelessWidget {
  final String title;
  final Color tagColor;

  const TransactionTag(
      {super.key, required this.title, required this.tagColor});

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
              fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ],
    );
  }
}
