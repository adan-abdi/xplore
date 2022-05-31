import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class AppbarSearch extends StatelessWidget with PreferredSizeWidget {
  const AppbarSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepOrange, width: .0),
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
        onTap: () {},
        onChanged: (String v) {},
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
