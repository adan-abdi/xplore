import 'package:flutter/material.dart';

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
      ],
    );
  }
}
