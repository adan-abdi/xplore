// Flutter imports:
import 'package:flutter/material.dart';

class PTop extends StatelessWidget {
  const PTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // SizedBox(height: 100,),
          Container(
              color: Colors.deepOrange,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/140x100')),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'John Doe',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Cerials Shop',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
