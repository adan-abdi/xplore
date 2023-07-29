import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 155,
        height: 220,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  image
            Expanded(
                flex: 4,
                child: Container(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/general/shoe.jpg",
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ))),

            //  pricing and add to card
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nike Airmax"),
                      Text("Ksh. 8000"),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: XploreColors.xploreOrange,
                          ),
                          child: Text("Order", style: TextStyle(color: XploreColors.white),),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
