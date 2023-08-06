import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

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
                    color: XploreColors.deepBlue,
                    child: widget.product.productImageUrl != null &&
                            widget.product.productImageUrl!.isNotEmpty
                        ? Image.network(
                            widget.product.productImageUrl!,
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.shopping_cart_checkout_rounded,
                            color: XploreColors.white,
                            size: 72,
                          ))),
          ),

          //  content
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: UnconstrainedBox(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: XploreColors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  product name
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  product name
                          Text(
                            widget.product.productName!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          vSize10SizedBox,
                          //  product price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Ksh. ${widget.product.productSellingPrice!}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Seller : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: XploreColors.deepBlue),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.store_rounded,
                                          color: XploreColors.xploreOrange,
                                          size: 16,
                                        ),
                                        hSize10SizedBox,
                                        Text(
                                          widget
                                              .product.sellerName!.getStoreName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: XploreColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          ),

          //  add to cart button
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: UnconstrainedBox(
              child: Container(
                width: 320,
                height: 60,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: XploreColors.deepBlue,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: XploreColors.white, width: 4),
                                    borderRadius: BorderRadius.circular(100),
                                    color: XploreColors.deepBlue,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove_rounded,
                                      color: XploreColors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: XploreColors.white,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: XploreColors.white, width: 4),
                                    borderRadius: BorderRadius.circular(100),
                                    color: XploreColors.deepBlue,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add_rounded,
                                      color: XploreColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100))),
                      child: UnconstrainedBox(
                        child: Container(
                          decoration: BoxDecoration(
                              color: XploreColors.xploreOrange,
                              borderRadius: BorderRadius.circular(100)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              Icon(Icons.add_circle_rounded,
                                  color: XploreColors.white),
                              hSize10SizedBox,
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                    color: XploreColors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
