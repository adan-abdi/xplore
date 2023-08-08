import 'package:flutter/cupertino.dart';

class PaymentMethod {
  final String title;
  final IconData? iconData;
  final String? svgAsset;

  PaymentMethod({required this.title, this.iconData, this.svgAsset});
}
