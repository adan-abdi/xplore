import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';

import '../../../feature_merchant_store/domain/model/product_model.dart';
import '../controller/home_controller.dart';

class ProductViewPage extends StatefulWidget {
  final ProductModel product;

  const ProductViewPage({super.key, required this.product});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.whiteSmoke,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: XploreColors.white,
            systemNavigationBarColor:
                _homeController.activeBottomBarIndex.value == 2
                    ? XploreColors.deepBlue
                    : XploreColors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        backgroundColor: XploreColors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_rounded, color: XploreColors.deepBlue)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_rounded,
                  color: XploreColors.deepBlue)),
          //  favourites
          UnconstrainedBox(
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: XploreColors.deepBlue),
              child: Center(
                child: Icon(Icons.favorite_outline_rounded,
                    color: XploreColors.xploreOrange),
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //  image
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: UnconstrainedBox(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    color: Colors.red,
                    child: widget.product.productImageUrl != null &&
                            widget.product.productImageUrl!.isNotEmpty
                        ? Image.network(
                            widget.product.productImageUrl!,
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.shopping_cart_checkout_rounded,
                            color: XploreColors.white,
                            size: 32,
                          ))),
          ),

          //  content
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: UnconstrainedBox(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                        color: XploreColors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24),
                            topLeft: Radius.circular(24))))),
          ),
          //  add to cart button
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: UnconstrainedBox(
              child: Container(
                width: 300,
                height: 60,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: XploreColors.deepBlue,
                    borderRadius: BorderRadius.circular(24)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
