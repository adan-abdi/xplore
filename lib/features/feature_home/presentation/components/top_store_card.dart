import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class TopStoreCard extends StatelessWidget {
  const TopStoreCard({super.key});

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
                    borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/general/lady.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              hSize20SizedBox,
              Text(
                "Phoenix Stores",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: XploreColors.white),
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
                    text: " sales",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: XploreColors.xploreOrange)),
              ])),
              //  trend icon
              Icon(Icons.trending_up_rounded, color: XploreColors.orange, size: 48,)
            ],
          )
        ],
      ),
    );
  }
}
