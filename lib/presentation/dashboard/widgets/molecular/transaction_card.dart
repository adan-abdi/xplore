// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class Transactioncard extends StatelessWidget {
  final String name;
  final String quantity;
  final String date;
  final String price;

  Transactioncard({
    Key? key,
    required this.name,
    required this.quantity,
    required this.date,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var amount = price.toUpperCase();
    var dateParsed = DateFormat('yyyy-MM-dd HH:mm').parse(date);
    var dateOrdered = DateFormat.yMMMd().format(dateParsed);
    return Container(
      padding: EdgeInsets.all(0),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            child: Container(
              color: XploreColors.xploreOrange.withOpacity(.3),
              width: 40,
              height: 40,
              child: Icon(
                Icons.receipt_long,
                color: XploreColors.xploreOrange,
              ),
            ),
          ),
          hSize20SizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "$dateOrdered",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: XploreColors.deepBlue,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "KES $amount",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          hSize20SizedBox,
          Column(
            children: [
              MaterialButton(
                  color: XploreColors.deepBlue,
                  onPressed: () {},
                  child: Row(
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.add,
                          color: XploreColors.white,
                        ),
                      ),
                      hSize10SizedBox,
                      Text(
                        '$quantity',
                        style: TextStyle(color: XploreColors.white),
                      ),
                      hSize10SizedBox,
                      InkWell(
                        child: Icon(
                          Icons.remove,
                          color: XploreColors.white,
                        ),
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
