import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class TopStoreCard extends StatelessWidget {
  final UserModel store;

  const TopStoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: XploreColors.deepBlue),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: store.userProfilePicUrl != null &&
                          store.userProfilePicUrl!.isNotEmpty
                      ? Image.network(
                          store.userProfilePicUrl!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: Icon(
                            Icons.person_rounded,
                            color: XploreColors.white,
                          ),
                        ),
                ),
              ),
              hSize20SizedBox,
              Text(
                store.userName!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                color: XploreColors.orange,
                size: 48,
              )
            ],
          )
        ],
      ),
    );
  }
}
