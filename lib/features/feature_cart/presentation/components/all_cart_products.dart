import 'package:flutter/material.dart';

import '../../../../application/core/themes/colors.dart';

class AllCartProducts extends StatefulWidget {
  const AllCartProducts({super.key});

  @override
  State<AllCartProducts> createState() => _AllCartProductsState();
}

class _AllCartProductsState extends State<AllCartProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: XploreColors.whiteSmoke,
      child: CustomScrollView(
        slivers: [

          //  All Cart Products
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Text("Hello"),
                    childCount: 10)),
          )
        ],
      ),
    );
  }
}
