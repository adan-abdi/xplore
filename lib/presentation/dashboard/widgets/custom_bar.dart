// Flutter imports:
import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';

// Project imports:
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/presentation/dashboard/pages/Profile.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.8,
            color: XploreColors.white,
            child: Icon(Icons.menu),
          ),
        ),
      ),
      title: Text(
        'Merchant Name',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            color: Colors.deepOrange,
            child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          ),
        ),
      ],
      flexibleSpace: Column(
        children: [
          vSize70SizedBox,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.deepOrange, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.deepOrange,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.deepOrange,
                ),
                hintText: "Search",
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
