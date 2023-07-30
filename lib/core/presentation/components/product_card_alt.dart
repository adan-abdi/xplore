import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class ProductCardAlt extends StatefulWidget {

  final ProductModel product;

  const ProductCardAlt({super.key, required this.product});

  @override
  State<ProductCardAlt> createState() => _ProductCardAltState();
}

class _ProductCardAltState extends State<ProductCardAlt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24)
      ),
      child: Row(
        children: [
          //  image
          Container(
            width: 84,
            height: double.infinity,
            decoration: BoxDecoration(
                color: XploreColors.deepBlue,
                borderRadius: BorderRadius.circular(24)
            ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Superloaf Bread", style: TextStyle(fontSize: 18),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ksh. 47.00"),

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
                          child: Center(child: Icon(Icons.remove_rounded, color: XploreColors.white,),),
                        ),
                        hSize10SizedBox,
                        Text("1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        hSize10SizedBox,
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: XploreColors.deepBlue,
                          ),
                          child: Center(child: Icon(Icons.add_rounded, color: XploreColors.white,),),
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
