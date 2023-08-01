import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/top_store_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../feature_merchant_store/domain/model/store_model.dart';

class TopStoresSection extends StatefulWidget {
  const TopStoresSection({super.key});

  @override
  State<TopStoresSection> createState() => _TopStoresSectionState();
}

class _TopStoresSectionState extends State<TopStoresSection> {
  late final CarouselController _carouselController;

  @override
  void initState() {
    super.initState();

    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
              child: Text("Top Stores", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

          vSize20SizedBox,

          //  top stores carousel
          CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) => TopStoreCard(),
              carouselController: _carouselController,
              options: CarouselOptions(
                  height: 170,
                  initialPage: 0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.85,
                  scrollPhysics: const BouncingScrollPhysics(),
                  onPageChanged: (index, reason) {})),

          vSize20SizedBox,

          //  carousel indicators
          AnimatedSmoothIndicator(
            activeIndex: 0,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: XploreColors.xploreOrange,
                dotColor: XploreColors.deepBlue.withOpacity(0.2)),
            onDotClicked: (index) {
              _carouselController.animateToPage(index);
            },
          ),
          //  top stores carousel indicators
        ],
      ),
    );
  }
}
