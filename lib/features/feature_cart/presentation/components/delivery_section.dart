import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/domain/model/delivery_types.dart';
import 'package:shamiri/features/feature_cart/presentation/controller/cart_controller.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';
import 'package:get/get.dart';

class DeliverySection extends StatefulWidget {
  const DeliverySection({super.key});

  @override
  State<DeliverySection> createState() => _DeliverySectionState();
}

class _DeliverySectionState extends State<DeliverySection> {
  late final CartController _cartController;

  @override
  void initState() {
    super.initState();

    _cartController = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  title
          Text("Delivery Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          vSize10SizedBox,

          Text("Choose delivery type",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),

          // delivery pills
          vSize20SizedBox,

          Row(
            children: [
              Obx(
                () => PillBtn(
                    text: "Door Delivery",
                    iconData: Icons.car_crash_rounded,
                    onTap: () => _cartController.setActiveDeliveryType(
                        deliveryType: DeliveryTypes.door_delivery),
                    isActive: _cartController.activeDeliveryType.value ==
                        DeliveryTypes.door_delivery),
              ),
              hSize20SizedBox,
              Obx(
                () => PillBtn(
                    text: "Pick up",
                    iconData: Icons.shopping_basket_rounded,
                    onTap: () => _cartController.setActiveDeliveryType(
                        deliveryType: DeliveryTypes.pick_up),
                    isActive: _cartController.activeDeliveryType.value ==
                        DeliveryTypes.pick_up),
              )
            ],
          ),

          //  proceed button
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    foregroundColor: XploreColors.xploreOrange),
                child: Text("Next")),
          )
        ],
      ),
    );
  }
}
