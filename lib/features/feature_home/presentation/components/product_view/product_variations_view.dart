import 'package:flutter/material.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:get/get.dart';

import '../../../../../application/core/themes/colors.dart';
import '../../../../../domain/value_objects/app_spaces.dart';
import '../../../../feature_merchant_store/presentation/components/variation_group_item.dart';
import '../../../../feature_merchant_store/presentation/components/variation_group_item_alt.dart';

class ProductVariationsView extends StatelessWidget {
  final ProductModel product;

  const ProductVariationsView({super.key, required this.product});

  List<String> getGroupsFromVariations() {
    return product.productVariations!
        .map((variation) => variation.variationGroup!)
        .toSet()
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: XploreColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.color_lens_rounded,
                color: XploreColors.deepBlue,
              ),
              hSize10SizedBox,
              Text(
                "Choose variations",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),

          //  variation groups in product list
          Container(
            height: 120,
            child: ListView.separated(
              itemBuilder: (context, index) => VariationGroupItemAlt(
                group: getGroupsFromVariations()[index],
                variationsInGroup: product.productVariations!
                    .where((variation) =>
                        variation.variationGroup! ==
                        getGroupsFromVariations()[index])
                    .toList(),
              ),
              separatorBuilder: (context, index) => hSize20SizedBox,
              itemCount: getGroupsFromVariations().length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
