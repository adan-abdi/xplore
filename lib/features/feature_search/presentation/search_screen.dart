import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/product_card.dart';

import '../../../application/core/themes/colors.dart';
import '../../../core/presentation/components/custom_textfield_alt.dart';
import '../../feature_home/presentation/controller/home_controller.dart';
import '../../feature_home/presentation/screens/product_view_page.dart';
import '../../feature_merchant_store/domain/model/product_model.dart';

class SearchPage extends StatefulWidget {
  final List<ProductModel> products;

  const SearchPage({super.key, required this.products});

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
        toolbarHeight: 80,
        title: Container(
          child: Center(
            child: Hero(
              tag: 'search',
              child: CustomTextFieldAlt(
                  hint: "Search For Products",
                  autoFocusEnabled: true,
                  iconData: Icons.search_rounded,
                  textStyle: TextStyle(fontSize: 16),
                  showLeading: false,
                  controller: _searchController,
                  onChanged: (query) {
                    _homeController.searchForProducts(
                        query: query, products: widget.products);
                  }),
            ),
          ),
        ),
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
              //  all products toggle pill buttons
              Obx(
                () => _homeController.filteredProducts.isNotEmpty
                    ? SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            (context, index) => ProductCard(
                                  product:
                                      _homeController.filteredProducts[index],
                                  onTap: () => Get.to(() => ProductViewPage(
                                      product: _homeController
                                          .filteredProducts[index])),
                                ),
                            childCount:
                                _homeController.filteredProducts.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 180,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 12))
                    : SliverFillRemaining(
                        child: Column(
                          children: [
                            MyLottie(lottie: 'assets/general/search.json'),
                            vSize20SizedBox,
                            Text("Search for products"),
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
