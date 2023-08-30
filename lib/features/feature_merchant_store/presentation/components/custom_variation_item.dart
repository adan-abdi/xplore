import 'package:flutter/material.dart';

import '../../../../core/presentation/components/custom_textfield.dart';

class CustomVariationItem extends StatelessWidget {

  final TextEditingController controller = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final Function(String) onVariationNameChanged;
  final Function(String) onVariationPriceChanged;

  CustomVariationItem({super.key, required this.onVariationNameChanged, required this.onVariationPriceChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextField(
            hint: "Variation Name",
            iconData: Icons.shopping_basket_rounded,
            textStyle: TextStyle(fontSize: 16),
            inputType: TextInputType.number,
            controller: controller,
            onChanged: onVariationNameChanged),

        CustomTextField(
            hint: "Variation Price (Ksh)",
            iconData: Icons.attach_money_rounded,
            textStyle: TextStyle(fontSize: 16),
            inputType: TextInputType.number,
            controller: priceController,
            onChanged: onVariationPriceChanged),
      ],
    );
  }
}
