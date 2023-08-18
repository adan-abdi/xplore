import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';
import 'package:shamiri/features/feature_home/presentation/components/product_card.dart';
import 'package:shamiri/features/feature_home/presentation/components/top_store_card.dart';
import 'package:shamiri/features/feature_home/presentation/screens/product_view_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../core/presentation/components/my_lottie.dart';
import '../../../feature_merchant_store/presentation/components/store_overview_card.dart';
import '../controller/home_controller.dart';

class StoreViewPage extends StatefulWidget {
  final UserModel store;

  const StoreViewPage({super.key, required this.store});

  @override
  State<StoreViewPage> createState() => _StoreViewPageState();
}

class _StoreViewPageState extends State<StoreViewPage> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();

    _homeController.filterProductsByStore(sellerId: widget.store.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: XploreColors.white,
            systemNavigationBarColor: XploreColors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        backgroundColor: XploreColors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_rounded, color: XploreColors.deepBlue)),
        title: Text("Store View", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // store header
              SliverToBoxAdapter(
                  child: Column(
                    children: [
                      TopStoreCard(
                        store: widget.store,
                        margin: 0,
                        onTap: () {},
                      ),

                      vSize20SizedBox,

                      //  call / message button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              final messageUrl = Uri(scheme: 'sms',
                                  path: widget.store.userPhoneNumber!);

                              launchUrl(messageUrl);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: XploreColors.deepBlue
                              ),
                              child: Center(
                                child: Icon(Icons.message_rounded,
                                  color: XploreColors.white,),
                              ),
                            ),
                          ),
                          hSize10SizedBox,
                          GestureDetector(
                            onTap: (){
                              final phoneUrl = Uri(scheme: 'tel',
                                  path: widget.store.userPhoneNumber!);

                              launchUrl(phoneUrl);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: XploreColors.deepBlue
                              ),
                              child: Center(
                                child: Icon(Icons.call_rounded,
                                  color: XploreColors.white,),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              SliverToBoxAdapter(
                child: vSize20SizedBox,
              ),
              //  store products
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      "Products",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: vSize30SizedBox,
              ),

              //  products within this category
              Obx(
                    () =>
                _homeController.storeProducts.isNotEmpty
                    ? SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                            ProductCard(
                              product: _homeController.storeProducts[index],
                              onTap: () =>
                                  Get.to(() =>
                                      ProductViewPage(
                                          product: _homeController
                                              .storeProducts[index])),
                            ),
                        childCount: _homeController.storeProducts.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 180,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 12))
                    : SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyLottie(
                        lottie: 'assets/general/xplore_loader.json', height: 200,),
                      vSize10SizedBox,
                      Text("No Products yet")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
