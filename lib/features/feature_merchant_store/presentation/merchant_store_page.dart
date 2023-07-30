import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/domain/model/product_model.dart';
import 'package:shamiri/core/presentation/components/open_bottom_sheet.dart';
import 'package:shamiri/core/presentation/components/product_card_alt.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/add_product_bottom_sheet.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/store_overview_card.dart';
import 'package:shamiri/presentation/core/widgets/molecular/dashboard_tab_action_button.dart';

class MerchantStorePage extends StatefulWidget {
  const MerchantStorePage({super.key});

  @override
  State<MerchantStorePage> createState() => _MerchantStorePageState();
}

class _MerchantStorePageState extends State<MerchantStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: XploreColors.white,
        floatingActionButton: MerchantStoreFAB(
            actionIcon: Icons.add_circle_rounded,
            actionLabel: "Add Products",
            onPressed: () {
              //  open bottomsheet to add products
              openBottomSheet(
                  content: AddProductBottomSheet(), onComplete: () {});
            }),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            //  store overview
            StoreOverViewCard(),

            SliverToBoxAdapter(child: vSize20SizedBox,),

            //  my products header
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                  child: Text("My Products", style: TextStyle(fontSize: 18))),
            ),

            SliverToBoxAdapter(child: vSize20SizedBox,),

            //  All Products
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ProductCardAlt(product: ProductModel()),
                      childCount: 20)),
            )
          ],
        ));
  }
}
