import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/variation_model.dart';

import '../../../../core/presentation/components/custom_textfield.dart';

class CustomVariationDialog extends StatefulWidget {
  final VariationModel? variationModel;
  final Function(String) onNameChanged;
  final Function(String) onPriceChanged;
  final Function(bool) onAffectsPriceChange;

  CustomVariationDialog(
      {super.key,
      this.variationModel,
      required this.onNameChanged,
      required this.onPriceChanged,
      required this.onAffectsPriceChange});

  @override
  State<CustomVariationDialog> createState() => _CustomVariationDialogState();
}

class _CustomVariationDialogState extends State<CustomVariationDialog> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool affectsPrice = false;

  @override
  void initState() {
    super.initState();

    if (widget.variationModel != null) {
      controller.setText(widget.variationModel!.variationName!);
      priceController
          .setText(widget.variationModel!.variationPrice!.toString());

      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          affectsPrice = widget.variationModel!.variationAffectsPrice!;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
              hint: "Name",
              iconData: Icons.shopping_basket_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.text,
              controller: controller,
              onChanged: widget.onNameChanged),
          CustomTextField(
              hint: "Price (Ksh)",
              iconData: Icons.attach_money_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.number,
              controller: priceController,
              onChanged: widget.onPriceChanged),
          ListTile(
            leading: Checkbox(
              value: affectsPrice,
              onChanged: (isChecked) {
                widget.onAffectsPriceChange(isChecked!);
                setState(() {
                  affectsPrice = isChecked;
                });
              },
              activeColor: XploreColors.xploreOrange,
              visualDensity: VisualDensity(horizontal: -4),
            ),
            contentPadding: EdgeInsets.zero,
            onTap: () {
              widget.onAffectsPriceChange(!affectsPrice);
              setState(() {
                affectsPrice = !affectsPrice;
              });
            },
            title: Text('Variation affects price.'),
          )
        ],
      ),
    );
  }
}
