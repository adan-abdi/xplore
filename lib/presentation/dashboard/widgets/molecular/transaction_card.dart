// Flutter imports:
import 'package:flutter/material.dart';

class Transactioncard extends StatelessWidget {
  final String name;
  final String quantity;

  Transactioncard({
    Key? key,
    required this.name,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        height: 90,
        child: ListTile(
          leading: Icon(
            Icons.receipt_long,
          ),
          title: Text("  $name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              )),
          subtitle: Text("  $quantity Items",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              )),
        ));
  }
}
