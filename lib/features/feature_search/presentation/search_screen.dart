import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../application/core/themes/colors.dart';
import '../../../core/presentation/components/custom_textfield_alt.dart';
import '../../feature_home/presentation/components/all_products_section.dart';
import '../../feature_home/presentation/controller/home_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _searchController = TextEditingController();
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
            icon: Icon(Icons.cancel_rounded, color: XploreColors.deepBlue)),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              //  Search bar
              SliverToBoxAdapter(
                child: Hero(
                  tag: 'search',
                  child: CustomTextFieldAlt(
                      hint: "Search For Products",
                      autoFocusEnabled: true,
                      iconData: Icons.search_rounded,
                      textStyle: TextStyle(fontSize: 16),
                      controller: _searchController,
                      onChanged: (value) {}),
                ),
              ),

              SliverToBoxAdapter(
                child: vSize30SizedBox,
              ),

              //  all products toggle pill buttons
              AllProductsSection()
            ],
          ),
        ),
      ),
    );
  }
}
