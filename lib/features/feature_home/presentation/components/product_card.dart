import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: UnconstrainedBox(
        child: Container(
          width: 150,
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: XploreColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  image
              Expanded(
                  flex: 5,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: product.productImageUrl != null &&
                                    product.productImageUrl!.isNotEmpty
                                ? XploreColors.white
                                : XploreColors.deepBlue,
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: product.productImageUrl != null &&
                                        product.productImageUrl!.isNotEmpty
                                    ? Image.network(
                                        product.productImageUrl!,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(
                                        Icons.shopping_cart_checkout_rounded,
                                        color: XploreColors.white,
                                        size: 32,
                                      ),
                              )
                            ],
                          )),
                    ],
                  )),

              //  pricing and add to card
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Ksh. ${product.productSellingPrice!.toString().addCommas}",
                          style: TextStyle(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
