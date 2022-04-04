// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/presentation/core/widgets/xplore_card.dart';

class XploreAppBar extends StatelessWidget with PreferredSizeWidget {
  const XploreAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
            color: Colors.deepOrange,
          ),
          hintText: "Search",
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
