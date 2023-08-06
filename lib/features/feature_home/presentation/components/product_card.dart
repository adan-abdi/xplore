import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 160,
        height: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: XploreColors.white),
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
                      margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: product.productImageUrl != null &&
                              product.productImageUrl!.isNotEmpty
                              ? XploreColors.white
                              : XploreColors.deepBlue,
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
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

                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: UnconstrainedBox(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: XploreColors.deepBlue,
                            border: Border.all(color: XploreColors.white, width: 5),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Icon(Icons.favorite_outline_rounded, color: XploreColors.xploreOrange, size: 20,),
                          ),
                        ),
                      ),
                    )
                  ],
                )),

            //  pricing and add to card
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName!,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Text(
                        "Ksh. ${product.productSellingPrice!}",
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
    );
  }
}
