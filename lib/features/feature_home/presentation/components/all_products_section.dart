import 'package:flutter/material.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn.dart';

class AllProductsSection extends StatefulWidget {
  const AllProductsSection({super.key});

  @override
  State<AllProductsSection> createState() => _AllProductsSectionState();
}

class _AllProductsSectionState extends State<AllProductsSection> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          //  all products pill buttons
          Container(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => index == 0
                    ? PillBtn(
                        text: "All",
                        isActive: true,
                        onTap: () {},
                      )
                    : PillBtn(text: "All", onTap: () {}),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
              ))

          //  all products
        ],
      ),
    );
  }
}
