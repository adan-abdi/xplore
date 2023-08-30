import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/variation_model.dart';

import '../../../../core/presentation/components/custom_textfield.dart';

class CustomVariationItem extends StatefulWidget {

  final VariationModel? variationModel;
  final Function(String) onNameChanged;
  final Function(String) onPriceChanged;

  CustomVariationItem({super.key, this.variationModel, required this.onNameChanged, required this.onPriceChanged});

  @override
  State<CustomVariationItem> createState() => _CustomVariationItemState();
}

class _CustomVariationItemState extends State<CustomVariationItem> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.variationModel != null) {
      controller.setText(widget.variationModel!.variationName!);
      priceController.setText(widget.variationModel!.variationPrice!.toString());
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
        ],
      ),
    );
  }
}
