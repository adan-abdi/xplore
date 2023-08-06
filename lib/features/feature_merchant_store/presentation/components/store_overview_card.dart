import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/profile_pic.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class StoreOverViewCard extends StatefulWidget {
  const StoreOverViewCard({super.key});

  @override
  State<StoreOverViewCard> createState() => _StoreOverViewCardState();
}

class _StoreOverViewCardState extends State<StoreOverViewCard> {
  late AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: XploreColors.deepBlue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Obx(() => ProfilePic(
                      imageUrl: _authController.user.value!.userProfilePicUrl)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: XploreColors.white)),
                        Text(_authController.user.value!.userName!.trimUserName,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Total Stock",
                              style: TextStyle(
                                  fontSize: 16, color: XploreColors.white)),
                          hSize10SizedBox,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
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
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Ksh. ",
                            style: TextStyle(
                                fontSize: 16,
                                color: XploreColors.xploreOrange)),
                        TextSpan(
                            text: "300",
                            style: TextStyle(
                                fontSize: 32, color: XploreColors.white)),
                      ])),
                    ],
                  ),
                  Icon(
                    Icons.trending_up_rounded,
                    color: XploreColors.xploreOrange,
                    size: 48,
                  )
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
