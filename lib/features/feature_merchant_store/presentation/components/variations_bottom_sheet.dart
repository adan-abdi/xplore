import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/presentation/components/show_alert_dialog.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/variation_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/custom_variation_item.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/variation_group_item.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/utils/merchant_constants.dart';
import 'package:shamiri/presentation/core/widgets/molecular/dashboard_tab_action_button.dart';

import '../../../feature_home/presentation/components/pill_btn_alt.dart';

class VariationsBottomSheet extends StatefulWidget {
  const VariationsBottomSheet({super.key});

  @override
  State<VariationsBottomSheet> createState() => _VariationsBottomSheetState();
}

class _VariationsBottomSheetState extends State<VariationsBottomSheet> {
  late final MerchantController _merchantController;
  String customVariationName = '';
  String customVariationPrice = '';

  @override
  void initState() {
    super.initState();

    _merchantController = Get.find<MerchantController>();
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
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          showAlertDialog(
                              title: "Add Variation",
                              iconData: Icons.add_rounded,
                              content: CustomVariationItem(
                                onNameChanged: (value) {
                                  setState(() {
                                    customVariationName = value;
                                  });
                                },
                                onPriceChanged: (value) {
                                  setState(() {
                                    customVariationPrice = value;
                                  });
                                },
                              ),
                              onCancel: () => Get.back(),
                              onConfirm: () {
                                _merchantController.addProductVariation(
                                    variation: VariationModel(
                                        variationName: customVariationName,
                                        variationPrice:
                                            int.parse(customVariationPrice),
                                        variationGroup: MerchantConstants
                                            .variationGroups[2]));

                                Get.back();
                              });
                        });
                      }),
                )),

            vSize20SizedBox,

            Visibility(
              visible: _merchantController.productVariations
                  .where((variation) =>
                      variation.variationGroup ==
                      MerchantConstants.variationGroups[2])
                  .isNotEmpty,
              child: Container(
                height: 35,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PillBtnAlt(
                          text: _merchantController.productVariations
                              .where((variation) =>
                                  variation.variationGroup ==
                                  MerchantConstants.variationGroups[2])
                              .toList()[index]
                              .variationName!,
                          isActive: true,
                          onTap: () {
                            //  open alert dialog to update the variation
                            showAlertDialog(
                                title: "Update Variation",
                                iconData: Icons.add_rounded,
                                content: CustomVariationItem(
                                  variationModel: _merchantController
                                      .productVariations
                                      .where((variation) =>
                                          variation.variationGroup ==
                                          MerchantConstants.variationGroups[2])
                                      .toList()[index],
                                  onNameChanged: (value) {
                                    setState(() {
                                      customVariationName = value;
                                    });
                                  },
                                  onPriceChanged: (value) {
                                    setState(() {
                                      customVariationPrice = value;
                                    });
                                  },
                                ),
                                onCancel: () => Get.back(),
                                onConfirm: () {
                                  _merchantController.updateProductVariation(
                                      index: _merchantController
                                          .productVariations
                                          .indexOf(_merchantController
                                              .productVariations
                                              .where((variation) =>
                                                  variation.variationGroup ==
                                                  MerchantConstants
                                                      .variationGroups[2])
                                              .toList()[index]),
                                      variation: VariationModel(
                                          variationName: customVariationName,
                                          variationPrice:
                                              int.parse(customVariationPrice),
                                          variationGroup: MerchantConstants
                                              .variationGroups[2]));

                                  Get.back();
                                });
                          }),
                      hSize5SizedBox,
                      Text(
                          "Ksh ${_merchantController.productVariations.where((variation) => variation.variationGroup == MerchantConstants.variationGroups[2]).toList()[index].variationPrice!.toString().addCommas}")
                    ],
                  ),
                  separatorBuilder: (context, index) => hSize10SizedBox,
                  itemCount: _merchantController.productVariations
                      .where((variation) =>
                          variation.variationGroup ==
                          MerchantConstants.variationGroups[2])
                      .length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            vSize20SizedBox,

            //  variations
            ListView.builder(
                itemBuilder: (context, index) => index != 2
                    ? VariationGroupItem(
                        group: MerchantConstants.variationGroups[index])
                    : SizedBox.shrink(),
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
