import 'package:flutter/cupertino.dart';
import 'package:shamiri/features/feature_cart/domain/model/delivery_types.dart';
import 'package:shamiri/features/feature_cart/domain/model/payment_types.dart';

class DeliveryMethod {
  final String title;
  final DeliveryTypes deliveryType;
  final IconData? iconData;
  final String? svgAsset;

  DeliveryMethod({required this.title, required this.deliveryType, this.iconData, this.svgAsset});
}
