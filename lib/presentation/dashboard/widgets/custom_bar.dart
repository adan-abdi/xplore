
import 'package:flutter/material.dart';
import 'package:xplore/presentation/dashboard/pages/Profile.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.8,
          //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.deepOrange,
          child: Icon(Icons.menu),
        ),
      ),
      title: Container(
          height: 39,
          width: MediaQuery.of(context).size.width * 0.7,
          color: Colors.deepOrange,
          child: Center(
            child: Text(
              'Merchant Name',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          )
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            color: Colors.deepOrange,
            child: IconButton(
              icon:  Icon(Icons.account_circle),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          ),
        ),
      ],
      flexibleSpace: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                fillColor: Colors.white,
                filled: true,
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepOrange, width: 2.0),
                  borderRadius: BorderRadius.zero,
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.deepOrange,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.deepOrange,),
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
