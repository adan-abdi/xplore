import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/variation_group_item.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/utils/merchant_constants.dart';

class VariationsBottomSheet extends StatefulWidget {
  const VariationsBottomSheet({super.key});

  @override
  State<VariationsBottomSheet> createState() => _VariationsBottomSheetState();
}

class _VariationsBottomSheetState extends State<VariationsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //  title
        Text(
          "Product Variations",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        //  variations
        ListView.builder(
            itemBuilder: (context, index) => VariationGroupItem(
                group: MerchantConstants.variationGroups[index]),
            itemCount: MerchantConstants.variationGroups.length,
            shrinkWrap: true),

        vSize20SizedBox,

        SubmitButton(
            iconData: Icons.done_rounded,
            text: "Save",
            isValid: true,
            onTap: () => Get.back())
      ],
    );
  }
}
