import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HamburgerMenuBtn extends StatefulWidget {
  final VoidCallback onTap;

  const HamburgerMenuBtn({super.key, required this.onTap});

  @override
  State<HamburgerMenuBtn> createState() => _HamburgerMenuBtnState();
}

class _HamburgerMenuBtnState extends State<HamburgerMenuBtn> {
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
      child: Obx(
        () => Container(
          color: _homeController.activeBottomBarIndex.value == 1
              ? XploreColors.deepBlue
              : XploreColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HamburgerBtn(width: 25),
              SizedBox(
                height: 4,
              ),
              HamburgerBtn(width: 15),
              SizedBox(
                height: 4,
              ),
              HamburgerBtn(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget HamburgerBtn({required double width}) => Obx(
        () => Container(
          width: width,
          height: 5,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
              color: _homeController.activeBottomBarIndex.value == 1
                  ? XploreColors.white
                  : XploreColors.deepBlue,
              borderRadius: BorderRadius.circular(30)),
        ),
      );
}
