import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/core/presentation/components/open_bottom_sheet.dart';
import 'package:shamiri/core/presentation/components/product_card_alt.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/add_product_bottom_sheet.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/store_overview_card.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/screens/merchant_transactions.dart';
import 'package:shamiri/presentation/core/widgets/molecular/dashboard_tab_action_button.dart';
import 'package:get/get.dart';

class MerchantStorePage extends StatefulWidget {
  const MerchantStorePage({super.key});

  @override
  State<MerchantStorePage> createState() => _MerchantStorePageState();
}

class _MerchantStorePageState extends State<MerchantStorePage> {
  late final MerchantController _merchantController;

  @override
  void initState() {
    super.initState();

    _merchantController = Get.find<MerchantController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: XploreColors.white,
        floatingActionButton: CustomFAB(
            actionIcon: Icons.add_circle_rounded,
            actionLabel: "Add Products",
            onPressed: () {
              //  open bottomsheet to add products
              openBottomSheet(
                  content: AddProductBottomSheet(), onComplete: () {});
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            //  store overview
            StoreOverViewCard(),

            SliverToBoxAdapter(
              child: vSize20SizedBox,
            ),

            //  store transactions
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    //  open transactions page
                    Get.to(() => MerchantTransactions());
                  },
                  child: Ink(
                    width: double.infinity,
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: XploreColors.deepBlue),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.receipt_rounded,
                                color: XploreColors.white),
                            hSize20SizedBox,
                            Text("My Transactions",
                                style: TextStyle(color: XploreColors.white)),
                          ],
                        ),
                        Icon(Icons.chevron_right_rounded,
                            color: XploreColors.white)
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: vSize20SizedBox,
            ),

            //  my products header
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                  child: Text("My Products", style: TextStyle(fontSize: 18))),
            ),

            SliverToBoxAdapter(
              child: vSize20SizedBox,
            ),

            //  All Products
            StreamBuilder<QuerySnapshot>(
                stream: _merchantController.getMerchantProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SliverToBoxAdapter(
                        child: MyLottie(lottie: 'assets/general/loading.json', width: 35, height: 35,));
                  }

                  if (snapshot.data == null || !snapshot.hasData) {
                    return SliverFillRemaining(child: Text("No Data found"));
                  }

                  var products = snapshot.data!.docs
                      .map((product) => ProductModel.fromJson(
                          product.data() as Map<String, dynamic>))
                      .toList();

                  return products.isNotEmpty
                      ? SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) => ProductCardAlt(
                                      product: products.elementAt(index)),
                                  childCount: products.length)),
                        )
                      : SliverToBoxAdapter(
                          child: Center(
                            child: Column(
                              children: [
                                MyLottie(lottie: 'assets/general/xplore_loader.json'),
                                Text("No Products yet")
                              ],
                            ),
                          ),
                        );
                }),
          ],
        ));
  }
}
