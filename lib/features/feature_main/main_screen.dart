import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/components/badged_icon.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_cart/presentation/screens/cart_screen.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_home/presentation/screens/home_page.dart';
import 'package:shamiri/features/feature_main/components/drawer_icon.dart';
import 'package:shamiri/features/feature_main/components/drawer_screen.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/screens/merchant_store_page.dart';
import 'package:shamiri/features/feature_profile/presentation/profile_page.dart';

import '../../application/core/themes/colors.dart';
import '../../core/presentation/components/hamburger.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badge;

import '../../core/presentation/controller/auth_controller.dart';
import '../feature_merchant_store/presentation/controller/merchant_controller.dart';
import '../feature_search/presentation/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AuthController _authController;
  late List<GButton> _bottomBarTabs;
  late HomeController _homeController;
  late MerchantController _merchantController;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();
    _merchantController = Get.find<MerchantController>();

    _authController.getUserDataFromFirestore().listen((user) {
      _authController.setUser(
          user: UserModel.fromJson(user.data() as Map<String, dynamic>));
    });

    _bottomBarTabs = [
      GButton(
        key: Key("home_screen_icon"),
        icon: Icons.home,
        haptic: false,
        text: "Home",
        onPressed: () {},
      ),
      GButton(
        key: Key("store_icon"),
        icon: Icons.store_rounded,
        haptic: false,
        text: "My Store",
        onPressed: () {},
      ),
      GButton(
        key: Key("profile_screen_icon"),
        icon: Icons.account_circle_rounded,
        haptic: false,
        text: "Profile",
        onPressed: () {},
      ),
    ];

    _pages = [
      HomePage(),
      MerchantStorePage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return _authController.user.value == null
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: XploreColors.white,
                child: Center(
                  child: MyLottie(
                    lottie: 'assets/general/loading.json',
                    width: 50,
                    height: 50,
                  ),
                ),
              )
            : ZoomDrawer(
                menuScreen: DrawerScreen(),
                mainScreen: Scaffold(
                  appBar: AppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: XploreColors.white,
                        systemNavigationBarColor: XploreColors.white,
                        systemNavigationBarIconBrightness: Brightness.dark),
                    backgroundColor: XploreColors.white,
                    title: Text(
                      _homeController.activeBottomBarIndex.value == 0
                          ? _authController.user.value!.userName!.trimUserName
                          : _homeController.activeBottomBarIndex.value == 1
                              ? "My Store"
                              : "Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: XploreColors.black),
                    ),
                    centerTitle: _homeController.activeBottomBarIndex.value != 1
                        ? true
                        : false,
                    leading: DrawerIcon(),
                    actions: [
                      IconButton(
                          onPressed: () => Get.to(() => CartScreen()),
                          icon: Obx(
                            () => BadgeIcon(
                                badgeCount: _authController
                                    .user.value!.itemsInCart!.length,
                                iconData: Icons.shopping_cart_rounded),
                          )),

                      //  profile image
                      Obx(
                        () => Visibility(
                          visible:
                              _homeController.activeBottomBarIndex.value == 0,
                          child: UnconstrainedBox(
                            child: Container(
                              width: 35,
                              height: 35,
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  color: XploreColors.deepBlue,
                                  borderRadius: BorderRadius.circular(100)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: _authController.user.value!
                                                  .userProfilePicUrl !=
                                              null &&
                                          _authController.user.value!
                                              .userProfilePicUrl!.isNotEmpty
                                      ? Image.network(
                                          _authController
                                              .user.value!.userProfilePicUrl!,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(
                                          Icons.person_rounded,
                                          color: XploreColors.white,
                                          size: 24,
                                        )),
                            ),
                          ),
                        ),
                      ),

                      //  MY Search PAGE
                      Obx(() => Visibility(
                          visible:
                              _homeController.activeBottomBarIndex.value == 1,
                          child: IconButton(
                              onPressed: () => Get.to(() => SearchPage(
                                  products:
                                      _merchantController.merchantProducts)),
                              icon: Icon(
                                Icons.search_rounded,
                                color: XploreColors.deepBlue,
                              )))),

                      //  MY STORE PAGE
                      Obx(() => Visibility(
                          visible:
                              _homeController.activeBottomBarIndex.value == 1,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.qr_code_scanner_rounded,
                                color: XploreColors.deepBlue,
                              )))),
                    ],
                    elevation: 0,
                  ),
                  body: Obx(
                    () => IndexedStack(
                      children: _pages,
                      index: _homeController.activeBottomBarIndex.value,
                    ),
                  ),
                  bottomNavigationBar: Container(
                    decoration:
                        BoxDecoration(color: XploreColors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 3)
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: GNav(
                        tabs: _bottomBarTabs,
                        selectedIndex:
                            _homeController.activeBottomBarIndex.value,
                        onTabChange: _homeController.setActiveBottomBarIndex,
                        backgroundColor: Colors.transparent,
                        color: XploreColors.deepBlue,
                        activeColor: XploreColors.xploreOrange,
                        tabBackgroundColor:
                            XploreColors.xploreOrange.withOpacity(0.1),
                        padding: const EdgeInsets.all(16),
                        gap: 8,
                      ),
                    ),
                  ),
                ),
                mainScreenTapClose: true,
                mainScreenScale: 0.3,
                menuBackgroundColor: XploreColors.xploreOrange,
                menuScreenTapClose: false,
                angle: 0,
                showShadow: true,
              );
      },
    );
  }
}
