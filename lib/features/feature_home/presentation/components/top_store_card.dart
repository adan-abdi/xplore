import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../../core/presentation/components/profile_pic.dart';

class TopStoreCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.only(right: margin),
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
                  imageUrl: store.userProfilePicUrl,
                  imageSize: 40,
                ),
                hSize20SizedBox,
                Text(
                  store.userName!.getStoreName,
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
                  store.storeLocation!.isNotEmpty
                      ? '${store.storeLocation!}'
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
                      text: "300",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: XploreColors.white)),
                  TextSpan(
                      text: " products",
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
