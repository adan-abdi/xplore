import 'package:flutter/material.dart';
import 'package:shamiri/core/utils/constants.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.productName!,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                          PopupMenuButton(
                            itemBuilder: (context) => [
                              //  delete product
                              PopupMenuItem(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete_forever_rounded,
                                      size: 16,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Delete Product",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                            color: XploreColors.white,
                            icon: Icon(
                              Icons.more_vert_rounded,
                              color: XploreColors.deepBlue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: XploreColors.xploreOrange,
                          ),
                          hSize10SizedBox,
                          Text(
                              'Ksh. ${product.productSellingPrice!.toString().addCommas}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //  category
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: XploreColors.xploreOrange),
                            child: Row(
                              children: [
                                Icon(
                                  product.productCategoryId!.isNotEmpty
                                      ? Constants.productCategoriesFiltered
                                          .firstWhere((category) =>
                                              category.categoryName ==
                                              product.productCategoryId!)
                                          .categoryIcon
                                      : Icons.category_rounded,
                                  color: XploreColors.white,
                                  size: 16,
                                ),
                                hSize5SizedBox,
                                Text(
                                  '${product.productCategoryId!.isEmpty ? "No category" : product.productCategoryId!}',
                                  style: TextStyle(color: XploreColors.white),
                                ),
                              ],
                            ),
                          ),
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
