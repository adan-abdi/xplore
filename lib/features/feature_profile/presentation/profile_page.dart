import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:shamiri/features/feature_profile/presentation/components/store_details_card.dart';
import 'package:shamiri/features/feature_profile/presentation/components/store_overview_card.dart';
import 'package:shamiri/features/feature_profile/presentation/components/user_profile_card.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final AuthController _authController;
  late final MerchantController _merchantController;
  late final List<Widget> storeOverviewCards;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
    _merchantController = Get.find<MerchantController>();

    storeOverviewCards = [
      Obx(
        () => StoreOverviewCardSettings(
          iconData: Icons.receipt_rounded,
          title: "Transactions",
          itemCount:
              _authController.user.value!.transactions!.length.toString(),
        ),
      ),
      Obx(
        () => StoreOverviewCardSettings(
          iconData: Icons.storefront_rounded,
          title: "Stock",
          itemCount: _merchantController.merchantProducts.length.toString(),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: XploreColors.white,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: XploreColors.deepBlue,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  user profile card
                  Obx(() => UserProfileCard(
                        user: _authController.user.value!,
                      )),
                  //  store details card
                  Obx(() =>
                      Align(
                        alignment: AlignmentDirectional.center,
                          child: StoreDetailsCard(user: _authController.user.value!))),
                  vSize20SizedBox,

                  //  store overview
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.storefront_rounded,
                                color: XploreColors.deepBlue),
                            hSize10SizedBox,
                            Text(
                              "Store Overview",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: XploreColors.deepBlue),
                            ),
                          ],
                        ),

                        vSize20SizedBox,

                        Container(
                          height: 80,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                storeOverviewCards[index],
                            itemCount: storeOverviewCards.length,
                            separatorBuilder: (context, index) =>
                                hSize20SizedBox,
                          ),
                        )

                        //  store overview card list
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
