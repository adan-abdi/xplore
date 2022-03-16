// Flutter imports:
import 'package:flutter/material.dart';

// Vertical (h)Prefix
Widget vSize10SizedBox = const SizedBox(height: 10);
Widget vSize20SizedBox = const SizedBox(height: 20);
Widget vSize30SizedBox = const SizedBox(height: 30);
Widget vSize40SizedBox = const SizedBox(height: 40);
Widget vSize50SizedBox = const SizedBox(height: 50);
Widget hHalf(BuildContext context) {
  return SizedBox(height: MediaQuery.of(context).size.height / 3);
}

// Horizontal (h)Prefix
Widget hSize10SizedBox = const SizedBox(width: 10);
Widget hSize20SizedBox = const SizedBox(width: 20);
Widget hSize30SizedBox = const SizedBox(width: 30);
Widget hSize40SizedBox = const SizedBox(width: 40);
Widget hSize50SizedBox = const SizedBox(width: 50);
