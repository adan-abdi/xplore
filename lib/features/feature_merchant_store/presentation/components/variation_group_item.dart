import 'package:flutter/material.dart';
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
    print(MerchantConstants.variations
        .where((variation) => variation.variationGroup! == widget.group)
        .toList());
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
          Container(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Obx(
                () => PillBtnAlt(
                    text: getGroupVariations()[index].variationName!,
                    isActive: _merchantController.productVariations
                        .contains(getGroupVariations()[index]),
                    onTap: () => _merchantController.addProductVariation(
                        variation: getGroupVariations()[index])),
              ),
              itemCount: getGroupVariations().length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => hSize10SizedBox,
            ),
          )
        ],
      ),
    );
  }
}
