// Flutter imports:
import 'package:flutter/material.dart';

class PList extends StatelessWidget {
  const PList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // scrollDirection: Axis.vertical,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                "Business Information",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
              onTap: (){},
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                "Business Information",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
              onTap: (){},
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                "Business Information",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
              onTap: (){},
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                  "Business Information",
                  style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
              onTap: (){},
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "Others",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                  "Business Information",
                  style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
              onTap: (){},
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                  "Business Information",
                  style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }
}
