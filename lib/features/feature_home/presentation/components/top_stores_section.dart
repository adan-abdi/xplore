import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopStoresSection extends StatefulWidget {
  const TopStoresSection({super.key});

  @override
  State<TopStoresSection> createState() => _TopStoresSectionState();
}

class _TopStoresSectionState extends State<TopStoresSection> {

  late final CarouselController _carouselController;
  late final List<>

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
          //  top stores carousel
          CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) => Container(color: Colors.red,),
              carouselController: _carouselController,
              options: CarouselOptions(
                  height: 200,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.8,
                  scrollPhysics:
                  const BouncingScrollPhysics(),
                  onPageChanged: (index, reason) {

                  })),

          vSize10SizedBox,

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
