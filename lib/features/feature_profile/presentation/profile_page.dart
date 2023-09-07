import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/show_toast.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/presentation/controller/core_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:shamiri/features/feature_profile/presentation/components/setting_card.dart';
import 'package:shamiri/features/feature_profile/presentation/components/store_details_card.dart';
import 'package:shamiri/features/feature_profile/presentation/components/store_overview_card.dart';
import 'package:shamiri/features/feature_profile/presentation/components/user_profile_card.dart';
import 'package:get/get.dart';
import 'package:shamiri/features/feature_profile/presentation/utils/profile_constants.dart';

import '../../feature_onboarding/presentation/screens/landing_page.dart';
import '../../../core/domain/model/version_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final AuthController _authController;
  late final CoreController _coreController;
  late final MerchantController _merchantController;
  late final List<Widget> storeOverviewCards;
  late final FToast _toast;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
    _coreController = Get.find<CoreController>();
    _merchantController = Get.find<MerchantController>();
    _toast = FToast();
    _toast.init(context);

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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                color: XploreColors.deepBlue,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  user profile card
                  Obx(() => UserProfileCard(
                        user: _authController.user.value!,
                      )),
                  vSize20SizedBox,

                  //  store details card
                  Obx(() => Align(
                      alignment: AlignmentDirectional.center,
                      child:
                          StoreDetailsCard(user: _authController.user.value!))),

                  vSize20SizedBox,

                  //  store description
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
                              "Description",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: XploreColors.deepBlue),
                            ),
                          ],
                        ),

                        vSize20SizedBox,

                        Text(_authController.user.value!.storeDescription!,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16)
                        )
                      ],
                    ),
                  ),

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
                              "Overview",
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
                      ],
                    ),
                  ),

                  vSize30SizedBox,

                  //  store other settings
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.settings_rounded,
                                color: XploreColors.deepBlue),
                            hSize10SizedBox,
                            Text(
                              "Settings",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: XploreColors.deepBlue),
                            ),
                          ],
                        ),

                        vSize10SizedBox,

                        //  store settings
                        ListView.builder(
                            itemBuilder: (context, index) => SettingCard(
                                setting: ProfileConstants.otherSettings[index],
                                onTap: () async {
                                  switch (ProfileConstants
                                      .otherSettings[index].title) {
                                    case "Terms of service":
                                      showToast(
                                          toast: _toast,
                                          iconData: Icons.timelapse_rounded,
                                          msg: "Coming soon");
                                      break;
                                    case "Logout":
                                      await _authController.signOut();

                                      _authController.setUserLoggedIn(
                                          isLoggedIn: false);

                                      //  navigate back to landing page
                                      Get.offAll(() => LandingPage());
                                      break;
                                  }
                                }),
                            itemCount: ProfileConstants.otherSettings.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true)
                      ],
                    ),
                  ),

                  vSize30SizedBox,

                  FutureBuilder(
                    future: _coreController.getPackageDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const Center(
                          child: Text(
                            "Couldn't retrieve app version",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      final version = snapshot.data! as VersionModel;

                      return Center(child: Text('Version ${version.version}'));
                    },
                  ),

                  vSize30SizedBox,
                ],
              ),
            ],
          ),
        ));
  }
}
