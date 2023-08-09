import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_home/presentation/screens/store_view_page.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/top_store_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/components/my_lottie.dart';
import '../../../feature_merchant_store/domain/model/store_model.dart';

class TopStoresSection extends StatefulWidget {
  const TopStoresSection({super.key});

  @override
  State<TopStoresSection> createState() => _TopStoresSectionState();
}

class _TopStoresSectionState extends State<TopStoresSection> {
  late final CarouselController _carouselController;
  late final HomeController _homeController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find();
    _authController = Get.find();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Top Stores",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),

          vSize20SizedBox,

          StreamBuilder(
              stream: _homeController.getAllStores(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return MyLottie(
                    lottie: 'assets/general/loading.json',
                    width: 30,
                    height: 30,
                  );
                }

                if (!snapshot.hasData) {
                  return Text("No Stores found");
                }

                var stores = snapshot.data!.docs
                    .map((store) => UserModel.fromJson(
                        store.data() as Map<String, dynamic>))
                    .where((store) =>
                        store.userId! != _authController.user.value!.userId)
                    .toList();

                return //  top stores carousel
                    Column(
                  children: [
                    CarouselSlider.builder(
                        itemCount: stores.length,
                        itemBuilder: (context, index, realIndex) =>
                            TopStoreCard(
                              store: stores[index],
                              onTap: () => Get.to(
                                  () => StoreViewPage(store: stores[index])),
                            ),
                        carouselController: _carouselController,
                        options: CarouselOptions(
                            height: 170,
                            initialPage: 0,
                            enlargeCenterPage: false,
                            enableInfiniteScroll: false,
                            viewportFraction: 1,
                            scrollPhysics: const BouncingScrollPhysics(),
                            onPageChanged: (index, reason) =>
                                _homeController.setActiveCarouselIndex(index))),

                    vSize20SizedBox,

                    //  carousel indicators
                    Obx(
                      () => AnimatedSmoothIndicator(
                        activeIndex: _homeController.activeCarouselIndex.value,
                        count: stores.length,
                        effect: ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: XploreColors.xploreOrange,
                            dotColor: XploreColors.deepBlue.withOpacity(0.2)),
                        onDotClicked: (index) {
                          _carouselController.animateToPage(index);
                        },
                      ),
                    ),
                  ],
                );
              }),
          //  top stores carousel indicators
        ],
      ),
    );
  }
}
