import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/cart_model.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
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
  late final HomeController _homeController;
  late final AuthController _authController;
  int itemCount = 1;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();
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
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline_rounded,
                  color: XploreColors.deepBlue)),
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
                    ),

                    vSize20SizedBox,

                    //  product units left
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: widget.product.productStockCount!.toString(),
                          style: TextStyle(
                              color: XploreColors.xploreOrange,
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: ' units remaining.', style: TextStyle()),
                    ])),

                    vSize40SizedBox,

                    //  product description
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.description_rounded,
                              color: XploreColors.deepBlue,
                            ),
                            hSize10SizedBox,
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),

                        vSize20SizedBox,

                        //  description
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                      ],
                    ),

                    vSize40SizedBox,

                    //  product reviews
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.comment_rounded,
                              color: XploreColors.deepBlue,
                            ),
                            hSize10SizedBox,
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),

                        vSize20SizedBox,

                        //  description
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                      ],
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
              child: Obx(
                () {
                  final isInCart = _authController.user.value!.itemsInCart!
                      .map((item) => item.cartProductId)
                      .toList()
                      .contains(widget.product.productId!);

                  return Container(
                    width: isInCart ? 330 : 320,
                    height: 60,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: XploreColors.deepBlue,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        bottomLeft: Radius.circular(100))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        if (itemCount > 1) {
                                          itemCount -= 1;
                                        }
                                      }),
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: XploreColors.white,
                                              width: 4),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: XploreColors.deepBlue,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove_rounded,
                                            color: XploreColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          itemCount.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: XploreColors.white,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        if (itemCount <
                                            int.parse(widget
                                                .product.productStockCount!))
                                          itemCount += 1;
                                      }),
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: XploreColors.white,
                                              width: 4),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: XploreColors.deepBlue,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add_rounded,
                                            color: XploreColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                        Expanded(
                            flex: isInCart ? 6 : 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      bottomRight: Radius.circular(100))),
                              child: GestureDetector(
                                onTap: () async {
                                  //  get initial cart items
                                  final List<CartModel> itemsInCart =
                                      _authController.user.value!.itemsInCart!;
                                  //  update the list
                                  if (isInCart) {
                                    //  remove item from list
                                    itemsInCart.removeWhere((item) =>
                                        item.cartProductId! ==
                                        widget.product.productId!);

                                    //  update items in cart
                                    _authController.updateUserDataInFirestore(
                                        newUser: UserModel(
                                            itemsInCart: itemsInCart));
                                  } else {
                                    //  Add item to list
                                    itemsInCart.add(CartModel(
                                        cartProductId:
                                            widget.product.productId!,
                                        cartProductCount: itemCount));
                                    //  update items in cart
                                    _authController.updateUserDataInFirestore(
                                        newUser: UserModel(
                                            itemsInCart: itemsInCart));
                                  }
                                },
                                child: UnconstrainedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: isInCart
                                            ? XploreColors.red
                                            : XploreColors.xploreOrange,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    child: Row(
                                      children: [
                                        Icon(
                                            isInCart
                                                ? Icons.remove_circle_rounded
                                                : Icons.add_circle_rounded,
                                            color: XploreColors.white),
                                        hSize10SizedBox,
                                        Text(
                                          isInCart
                                              ? "Remove from cart"
                                              : "Add to cart",
                                          style: TextStyle(
                                              color: XploreColors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
