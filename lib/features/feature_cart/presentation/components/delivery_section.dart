import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_cart/domain/model/delivery_types.dart';
import 'package:shamiri/features/feature_cart/presentation/controller/cart_controller.dart';
import 'package:shamiri/features/feature_cart/presentation/model/delivery_method.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';
import 'package:get/get.dart';

class DeliverySection extends StatefulWidget {
  const DeliverySection({super.key});

  @override
  State<DeliverySection> createState() => _DeliverySectionState();
}

class _DeliverySectionState extends State<DeliverySection> {
  late final CartController _cartController;
  late final List<DeliveryMethod> deliveryMethods;

  @override
  void initState() {
    super.initState();

    _cartController = Get.find<CartController>();

    deliveryMethods = [
      DeliveryMethod(
          title: "Door delivery",
          iconData: Icons.car_crash_rounded,
          deliveryType: DeliveryTypes.door_delivery),
      DeliveryMethod(
          title: "Pick up",
          iconData: Icons.shopping_basket_rounded,
          deliveryType: DeliveryTypes.pick_up),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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

          Container(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: deliveryMethods.length,
              itemBuilder: (context, index) => Obx(
                    () => PillBtn(
                    text: deliveryMethods[index].title,
                    iconData: deliveryMethods[index].iconData,
                    imageAsset: deliveryMethods[index].svgAsset,
                    isActive: _cartController.activeDeliveryType.value ==
                        deliveryMethods[index].deliveryType,
                    onTap: () => _cartController.setActiveDeliveryType(
                        deliveryType: deliveryMethods[index].deliveryType)),
              ),
              separatorBuilder: (context, index) => hSize10SizedBox,
            ),
          ),

          //  proceed button
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: TextButton(
                onPressed: () {
                  if (_cartController.activeDeliveryType.value ==
                      DeliveryTypes.door_delivery) {
                    _cartController.setIsAddressPast(isPast: true);
                  } else {
                    _cartController.setIsPaymentPast(isPast: true);
                  }
                },
                style: TextButton.styleFrom(
                    foregroundColor: XploreColors.xploreOrange),
                child: Text("Next")),
          )
        ],
      ),
    );
  }
}
