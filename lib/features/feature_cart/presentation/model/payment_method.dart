import 'package:flutter/cupertino.dart';
import 'package:shamiri/features/feature_cart/domain/model/payment_types.dart';

class PaymentMethod {
  final String title;
  final PaymentTypes paymentType;
  final IconData? iconData;
  final String? svgAsset;

  PaymentMethod({required this.title, required this.paymentType, this.iconData, this.svgAsset});
}
