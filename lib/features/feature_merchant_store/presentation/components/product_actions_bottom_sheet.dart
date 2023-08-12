import 'package:flutter/material.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../domain/value_objects/app_spaces.dart';

class ProductActionsBottomSheet extends StatelessWidget {

  final ProductModel product;

  const ProductActionsBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //  product details header
          Container(
            height: 120,
            child: Row(
              children: [
                //  image
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: XploreColors.deepBlue,
                      borderRadius: BorderRadius.circular(24)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: product.productImageUrl != null &&
                        product.productImageUrl!.isNotEmpty
                        ? Image.network(
                      product.productImageUrl!,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        product.productName!,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Ksh. ${product.productSellingPrice!.toString().addCommas}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

                          Text(
                              '${product.productStockCount!.toString().addCommas} in stock'),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
