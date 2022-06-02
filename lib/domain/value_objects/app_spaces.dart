// Flutter imports:
import 'package:flutter/material.dart';

// Vertical (h)Prefix
Widget vSize5SizedBox = const SizedBox(height: 5);
Widget vSize10SizedBox = const SizedBox(height: 10);
Widget vSize20SizedBox = const SizedBox(height: 20);
Widget vSize30SizedBox = const SizedBox(height: 30);
Widget vSize40SizedBox = const SizedBox(height: 40);
Widget vSize50SizedBox = const SizedBox(height: 50);
Widget vSize60SizedBox = const SizedBox(height: 60);
Widget vSize70SizedBox = const SizedBox(height: 70);
Widget vSize80SizedBox = const SizedBox(height: 80);
Widget vSize90SizedBox = const SizedBox(height: 90);
Widget hHalf(BuildContext context) {
  return SizedBox(height: MediaQuery.of(context).size.height / 3);
}

// Horizontal (h)Prefix
Widget hSize5SizedBox = const SizedBox(width: 5);
Widget hSize10SizedBox = const SizedBox(width: 10);
Widget hSize20SizedBox = const SizedBox(width: 20);
Widget hSize30SizedBox = const SizedBox(width: 30);
Widget hSize40SizedBox = const SizedBox(width: 40);
Widget hSize50SizedBox = const SizedBox(width: 50);

// Utils for calculating responsive height
double rHeight(BuildContext context, double magicNum) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (screenHeight / magicToRNum(screenHeight, magicNum));
}

double rWidth(BuildContext context, double magicNum) {
  double screenWidth = MediaQuery.of(context).size.width;
  return magicToRNum(screenWidth, magicNum);
}

double magicToRNum(double span, double magicNum) {
  double rNum = span / magicNum;
  return rNum;
}
