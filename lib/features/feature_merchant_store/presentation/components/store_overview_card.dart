import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/components/profile_pic.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';

class StoreOverviewCard extends StatefulWidget {
  final UserModel store;

  const StoreOverviewCard({super.key, required this.store});

  @override
  State<StoreOverviewCard> createState() => _StoreOverviewCardState();
}

class _StoreOverviewCardState extends State<StoreOverviewCard> {
  late final MerchantController _merchantController;

  @override
  void initState() {
    super.initState();

    _merchantController = Get.find<MerchantController>();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 180,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: XploreColors.deepBlue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  ProfilePic(imageUrl: widget.store.userProfilePicUrl),
                  hSize20SizedBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Hello",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: XploreColors.white)),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: XploreColors.xploreOrange),
                              child: Text(
                                "Aggregate",
                                style: TextStyle(color: XploreColors.white),
                              ),
                            )
                          ],
                        ),
                        Text(widget.store.userName!.trimUserName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: XploreColors.white)),
                      ],
                    ),
                  )
                ],
              ),

              vSize20SizedBox,

              //  total stock count
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Total Stock:",
                      style:
                          TextStyle(fontSize: 16, color: XploreColors.white)),
                  hSize10SizedBox,
                  Obx(
                    () => Text(
                        "Ksh. ${_merchantController.calculateTotalStock.toString().addCommas}",
                        style: TextStyle(
                            fontSize: 24,
                            color: XploreColors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )

              //  view transactions button
            ],
          ),
        ),
      ),
    );
  }
}
