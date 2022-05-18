// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/presentation/dashboard/widgets/p_list.dart';
import 'package:shamiri/presentation/dashboard/widgets/p_top.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.8,
            // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        // scrollDirection: Axis.vertical,
        // padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            PTop(),
            SizedBox(height: 20),
            PList(),
          ],
        ),
      ),
    );
  }
}
