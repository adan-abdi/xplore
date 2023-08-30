import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/variation_group_item.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/utils/merchant_constants.dart';
import 'package:shamiri/presentation/core/widgets/molecular/dashboard_tab_action_button.dart';

class VariationsBottomSheet extends StatefulWidget {
  const VariationsBottomSheet({super.key});

  @override
  State<VariationsBottomSheet> createState() => _VariationsBottomSheetState();
}

class _VariationsBottomSheetState extends State<VariationsBottomSheet> {
  late final List<Widget> customVariations;

  @override
  void initState() {
    super.initState();

    customVariations = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //  title
            Text(
              "Product Variations",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            vSize20SizedBox,

            //  custom variation
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomFAB(
                      actionIcon: Icons.add_rounded,
                      actionLabel: 'Add custom variation',
                      onPressed: () {
                        setState(() {
                          //  add dynamic widget
                          customVariations.add(Text("Hello"));
                        });
                      }),
                )),

            vSize20SizedBox,

            ListView.builder(
              itemBuilder: (context, index) => customVariations[index],
              itemCount: customVariations.length,
              shrinkWrap: true,
            ),

            vSize20SizedBox,

            //  variations
            ListView.builder(
                itemBuilder: (context, index) => VariationGroupItem(
                    group: MerchantConstants.variationGroups[index]),
                itemCount: MerchantConstants.variationGroups.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true),

            vSize20SizedBox,

            SubmitButton(
                iconData: Icons.done_rounded,
                text: "Save",
                isValid: true,
                onTap: () => Get.back())
          ],
        ),
      ),
    );
  }
}
