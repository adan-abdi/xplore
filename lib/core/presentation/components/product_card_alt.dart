import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../features/feature_merchant_store/presentation/controller/merchant_controller.dart';

class ProductCardAlt extends StatefulWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ProductCardAlt(
      {super.key,
      required this.product,
      required this.onTap,
      required this.onDelete});

  @override
  State<ProductCardAlt> createState() => _ProductCardAltState();
}

class _ProductCardAltState extends State<ProductCardAlt> {
  late final MerchantController _merchantController;

  @override
  void initState() {
    super.initState();

    _merchantController = Get.find<MerchantController>();
  }

  void decrementCount() {
    var currentProductCount = widget.product.productStockCount!;

    if (currentProductCount > 1) {
      currentProductCount -= 1;

      _merchantController.updateProduct(
          oldProduct: widget.product,
          newProduct: ProductModel(productStockCount: currentProductCount),
          response: (state) {});
    }
  }

  void incrementCount() {
    var currentProductCount = widget.product.productStockCount!;

    currentProductCount += 1;

    _merchantController.updateProduct(
        oldProduct: widget.product,
        newProduct: ProductModel(productStockCount: currentProductCount),
        response: (state) {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            //  image
            Container(
              width: 84,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: XploreColors.deepBlue,
                  borderRadius: BorderRadius.circular(24)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: widget.product.productImageUrl != null &&
                        widget.product.productImageUrl!.isNotEmpty
                    ? Image.network(
                        widget.product.productImageUrl!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.add_shopping_cart_rounded,
                        color: XploreColors.white,
                      ),
              ),
            ),

            hSize10SizedBox,

            //  description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.productName!,
                          style: TextStyle(
                              fontSize: 18, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Ksh. ${widget.product.productSellingPrice!.toString().addCommas}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),

                      //  delete icon
                      //  increment stock button
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => decrementCount(),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
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
                          ),
                          hSize10SizedBox,
                          Text(
                            '${widget.product.productStockCount!}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          hSize10SizedBox,
                          GestureDetector(
                            onTap: () => incrementCount(),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
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
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
