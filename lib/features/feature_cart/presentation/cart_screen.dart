import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/features/feature_cart/presentation/components/all_cart_products.dart';
import 'package:shamiri/features/feature_cart/presentation/components/checkout_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //  All Products
          AllCartProducts(),

          //  checkout container
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: CheckoutCard()
          ),
        ],
      ),
    );
  }
}
