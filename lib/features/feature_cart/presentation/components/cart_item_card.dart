import 'package:flutter/material.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../domain/value_objects/app_spaces.dart';

class CartItemCard extends StatelessWidget {
  final ProductModel product;
  final int cartQuantity;

  const CartItemCard({super.key, required this.product, required this.cartQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: XploreColors.white),
      child: Row(
        children: [
          //  image
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: XploreColors.deepBlue,
                borderRadius: BorderRadius.circular(24)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/general/shoe.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
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
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_rounded,
                          color: XploreColors.xploreOrange,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ksh. ${product.productSellingPrice!}'),

                    //  increment stock button
                    Row(
                      children: [
                        Container(
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
                        hSize10SizedBox,
                        Text(
                          '$cartQuantity',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        hSize10SizedBox,
                        Container(
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
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
