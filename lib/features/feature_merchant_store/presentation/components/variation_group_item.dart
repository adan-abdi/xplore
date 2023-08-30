import 'package:flutter/material.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/variation_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/utils/merchant_constants.dart';

import '../../../feature_home/presentation/components/pill_btn_alt.dart';
import 'package:get/get.dart';

class VariationGroupItem extends StatefulWidget {
  final String group;

  const VariationGroupItem({super.key, required this.group});

  @override
  State<VariationGroupItem> createState() => _VariationGroupItemState();
}

class _VariationGroupItemState extends State<VariationGroupItem> {
  late final MerchantController _merchantController;

  @override
  void initState() {
    super.initState();

    _merchantController = Get.find<MerchantController>();
  }

  List<VariationModel> getGroupVariations() {
    return MerchantConstants.variations
        .where((variation) => variation.variationGroup! == widget.group)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.group,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

          //  list for the variations
          ListView.builder(
              itemBuilder: (context, index) => Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: AlignmentDirectional.centerStart,
                            child: PillBtnAlt(
                                text:
                                    getGroupVariations()[index].variationName!,
                                isActive: _merchantController.productVariations
                                    .contains(getGroupVariations()[index]),
                                onTap: () =>
                                    _merchantController.addProductVariation(
                                        variation:
                                            getGroupVariations()[index])),
                          ),
                        ),

                        hSize20SizedBox,

                        //  input for the variation price
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: CustomTextField(
                                hint: "Variation price (Ksh)",
                                iconData: Icons.attach_money_rounded,
                                textStyle: TextStyle(fontSize: 16),
                                inputType: TextInputType.number,
                                value: getGroupVariations()[index]
                                            .variationPrice ==
                                        null
                                    ? null
                                    : getGroupVariations()[index]
                                        .variationPrice
                                        .toString(),
                                onChanged: (value) {
                                  MerchantConstants
                                      .variations[MerchantConstants.variations
                                          .indexOf(getGroupVariations()[index])]
                                      .variationPrice = int.parse(value);

                                  if (_merchantController.productVariations
                                      .contains(getGroupVariations()[index])) {
                                    _merchantController
                                        .productVariations[_merchantController
                                            .productVariations
                                            .indexOf(
                                                getGroupVariations()[index])]
                                        .variationPrice = int.parse(value);
                                  }

                                  print(
                                      "NEW VARIATION : ${getGroupVariations()[index].variationPrice}");
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
              itemCount: getGroupVariations().length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics())
        ],
      ),
    );
  }
}
