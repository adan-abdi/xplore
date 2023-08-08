import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';

import '../controller/cart_controller.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({super.key});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {

  late final CartController _cartController;

  @override
  void initState() {
    super.initState();

    _cartController = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _cartController.isAddressPast.value ? 1 : 0.1,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  title
            Text("Address",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            vSize10SizedBox,

            Text("Items will be delivered here.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),

            // delivery pills
            vSize20SizedBox,

            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                //  open view address details
              },
              child: Ink(
                width: double.infinity,
                height: 50,
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: XploreColors.deepBlue),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.add_home_work_rounded,
                              color: XploreColors.white),
                          hSize10SizedBox,
                          Expanded(
                            child: Text("Westlands, opposite Kilimall.",
                                style: TextStyle(color: XploreColors.white),
                            overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.expand_circle_down_rounded,
                        color: XploreColors.white)
                  ],
                ),
              ),
            ),

            //  proceed button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: XploreColors.xploreOrange),
                    child: Text("Change Address")),
                hSize10SizedBox,
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: XploreColors.xploreOrange),
                    child: Text("Next")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
