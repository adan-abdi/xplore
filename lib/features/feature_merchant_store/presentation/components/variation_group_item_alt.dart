import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/variation_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/utils/merchant_constants.dart';

import '../../../feature_home/presentation/components/pill_btn_alt.dart';
import 'package:get/get.dart';

class VariationGroupItemAlt extends StatefulWidget {
  final String group;
  final ProductModel product;
  final List<VariationModel> variationsInGroup;

  const VariationGroupItemAlt(
      {super.key,
      required this.group,
      required this.product,
      required this.variationsInGroup});

  @override
  State<VariationGroupItemAlt> createState() => _VariationGroupItemAltState();
}

class _VariationGroupItemAltState extends State<VariationGroupItemAlt> {
  late final HomeController _homeController;
  late final MerchantController _merchantController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _merchantController = Get.find<MerchantController>();
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 100,
        color: XploreColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      text: widget.variationsInGroup[index].variationName!,
                      isActive: _homeController.pickedVariations
                          .map((variation) => variation.variationName)
                          .contains(
                              widget.variationsInGroup[index].variationName),
                      onTap: () async {

                        //  all variations in product
                        final allVariations =
                            _homeController.pickedVariations;

                        if (allVariations
                            .map((variation) => variation.variationName)
                            .contains(
                                widget.variationsInGroup[index].variationName)) {
                          allVariations.removeWhere((v) =>
                              v.variationName ==
                              widget.variationsInGroup[index].variationName);
                          _homeController.removeProductVariation(
                              variation: widget.variationsInGroup[index]);

                          await _merchantController.updateProduct(
                              oldProduct: widget.product,
                              newProduct: ProductModel(
                                  activeProductVariations: allVariations),
                              response: (state) {});
                        } else {
                          allVariations.add(widget.variationsInGroup[index]);
                          _homeController.addProductVariation(
                              variation: widget.variationsInGroup[index]);

                          await _merchantController.updateProduct(
                              oldProduct: widget.product,
                              newProduct: ProductModel(
                                  activeProductVariations: allVariations),
                              response: (state) {});
                        }
                      }),
                ),
                itemCount: widget.variationsInGroup.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => hSize10SizedBox,
              ),
            )
          ],
        ),
      ),
    );
  }
}
