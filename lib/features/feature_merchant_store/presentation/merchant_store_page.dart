import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/core/presentation/components/open_bottom_sheet.dart';
import 'package:shamiri/domain/value_objects/app_asset_strings.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/add_product_bottom_sheet.dart';
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
            openBottomSheet(content: AddProductBottomSheet(), onComplete: (){});
          }),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Column(
            //   children: [
            //     MyLottie(lottie: xploreLoader),
            //     Text("Add Products to see them here.")
            //   ],
            // )

          ],
        ),
      ),
    );
  }
}
