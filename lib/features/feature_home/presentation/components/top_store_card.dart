import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../../core/presentation/components/profile_pic.dart';
import '../controller/home_controller.dart';

class TopStoreCard extends StatefulWidget {
  final UserModel store;
  final double height;
  final double margin;
  final VoidCallback onTap;

  const TopStoreCard(
      {super.key,
      required this.store,
      this.margin = 16,
      this.height = 200,
      required this.onTap});

  @override
  State<TopStoreCard> createState() => _TopStoreCardState();
}

class _TopStoreCardState extends State<TopStoreCard> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: widget.height,
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.only(right: widget.margin),
        decoration: BoxDecoration(
            color: XploreColors.deepBlue,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePic(
                  imageUrl: widget.store.userProfilePicUrl,
                  imageSize: 40,
                ),
                hSize20SizedBox,
                Text(
                  widget.store.userName!.getStoreName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: XploreColors.white),
                ),
              ],
            ),

            //  store location
            Row(
              children: [
                Icon(Icons.location_on_rounded,
                    color: XploreColors.xploreOrange, size: 16),
                hSize10SizedBox,
                Text(
                  widget.store.storeLocation!.isNotEmpty
                      ? '${widget.store.storeLocation!}'
                      : 'No location',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: XploreColors.white),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  store sales
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: _homeController.products
                          .where((p) => p.sellerId! == widget.store.userId!)
                          .length
                          .toString(),
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: XploreColors.white)),
                  TextSpan(
                      text: " product(s)",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: XploreColors.xploreOrange)),
                ])),
                //  trend icon
                Icon(
                  Icons.trending_up_rounded,
                  color: XploreColors.xploreOrange,
                  size: 48,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
