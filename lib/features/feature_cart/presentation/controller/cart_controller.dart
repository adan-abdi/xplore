import 'package:get/get.dart';
import 'package:shamiri/features/feature_cart/domain/model/delivery_types.dart';
import 'package:shamiri/features/feature_cart/domain/model/payment_types.dart';

class CartController extends GetxController {
  /// Delivery Information
  final activeDeliveryType = DeliveryTypes.door_delivery.obs;

  /// Payment
  final activePaymentType = PaymentTypes.cash.obs;

  void setActiveDeliveryType({required DeliveryTypes deliveryType}) =>
      activeDeliveryType.value = deliveryType;

  void setActivePaymentType({required PaymentTypes paymentType}) =>
      activePaymentType.value = paymentType;
}
