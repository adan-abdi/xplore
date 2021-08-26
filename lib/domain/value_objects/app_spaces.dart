import 'package:flutter/material.dart';

Widget hSize10SizedBox = const SizedBox(height: 10);
Widget hSize20SizedBox = const SizedBox(height: 20);
Widget hSize30SizedBox = const SizedBox(height: 30);
Widget hSize40SizedBox = const SizedBox(height: 40);
Widget hSize50SizedBox = const SizedBox(height: 50);
Widget hHalf(BuildContext context) {
  return SizedBox(height: MediaQuery.of(context).size.height / 3);
}
