import 'package:flutter/material.dart';
import 'package:shamiri/features/feature_cart/presentation/components/cart_item_card.dart';

import '../../../../application/core/themes/colors.dart';

class AllCartProducts extends StatefulWidget {
  const AllCartProducts({super.key});

  @override
  State<AllCartProducts> createState() => _AllCartProductsState();
}

class _AllCartProductsState extends State<AllCartProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: XploreColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          //  All Cart Products
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => CartItemCard(),
                    childCount: 10)),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 250,))
        ],
      ),
    );
  }
}
