import 'package:flutter/material.dart';

class PAppBar extends StatelessWidget with PreferredSizeWidget {
  const PAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.8,
          //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.white,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.deepOrange,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      title: Container(
          height: 39,
          width: MediaQuery.of(context).size.width * 0.7,
          color: Colors.white,
          child: Center(
            child: Text(
              'Merchant Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.deepOrange),
            ),
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
