// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/product_listing_status.dart';
import 'package:shamiri/application/singletons/search_state.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';

// ignore: must_be_immutable
class AppbarSearch extends StatefulWidget with PreferredSizeWidget {
  SearchStatus searchStatus;
  ProductListingStatus productListingStatus;

  AppbarSearch({
    Key? key,
    required this.searchStatus,
    required this.productListingStatus,
  }) : super(key: key);

  @override
  State<AppbarSearch> createState() => _AppbarSearchState();

  @override
  Size get preferredSize => Size.fromHeight(56);
}

class _AppbarSearchState extends State<AppbarSearch> {
  TextEditingController productSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    productSearchController.text = 'S.';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        cursorColor: Colors.grey,
        controller: productSearchController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: XploreColors.deepBlue, width: .0),
            borderRadius: BorderRadius.circular(5),
          ),
          border: new OutlineInputBorder(
            borderSide: new BorderSide(
              color: Colors.deepOrange,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: XploreColors.deepBlue,
          ),
          hintText: "Search product",
        ),
        onTap: () {
          setState(() {
            widget.productListingStatus.productState
                .add(ProductListingStates.search);
          });
        },
        onChanged: (String v) {
          widget.searchStatus.searchTerm.add(v);
        },
      ),
    );
  }
}
