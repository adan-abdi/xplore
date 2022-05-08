// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/infrastructure/local/database.dart';

class TransactionList extends StatefulWidget {
  final String tstatus;
  const TransactionList({Key? key, required this.tstatus}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState(this.tstatus);
}

class _TransactionListState extends State<TransactionList> {
  final String tstatus;

  _TransactionListState(this.tstatus);
  // _myList(String name, String quantity, String price, String units,
  //     String total, String date) {
  //   return Card(
  //     margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
  //     child: Column(
  //       children: <Widget>[
  //         ListTile(
  //           leading: Container(
  //               width: 30,
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   Text(
  //                     "x",
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 25,
  //                     ),
  //                   ),
  //                   Text("$quantity")
  //                 ],
  //               )),
  //           title: Text(
  //             '$name @ $price',
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 18,
  //             ),
  //           ),
  //           subtitle: Text(
  //             "$units",
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 12,
  //             ),
  //           ),
  //           trailing: Container(
  //             width: 100,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Text(
  //                   "$date",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 18,
  //                   ),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text("KES: $total")
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _transactions(String name, String quantity, String image) {
    return Container(
        padding: EdgeInsets.all(0),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.network(image),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Text("  $name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    )),
                SizedBox(height: 10),
                Text("  $quantity Items",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ))
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Database.readTransactions(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(child: Text('Something went wrong')));
          } else if (snapshot.hasData || snapshot.data != null) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext ctx, index) {
                        //var productInfo = snapshot.data!.docs[index].data()!;
                        String docID = snapshot.data!.docs[index].id;
                        String name = snapshot.data!.docs[index]["name"];
                        // String price = snapshot.data!.docs[index]["price"];
                        // String total = snapshot.data!.docs[index]["total"];
                        // String date = snapshot.data!.docs[index]["date"];
                        // String units = snapshot.data!.docs[index]["units"];
                        String qty = snapshot.data!.docs[index]["quantity"];
                        String image = snapshot.data!.docs[index]["image"];
                        String status = snapshot.data!.docs[index]["status"];

                        //return _myList(name, qty, price, units, total, date);

                        return Dismissible(
                            direction: DismissDirection.startToEnd,
                            key: Key(docID),
                            background: Container(
                              color: Colors.red,
                              child: Icon(Icons.delete),
                            ),
                            onDismissed: (direction) {
                              Database.deleteTransaction(docID)
                                  .whenComplete(() {
                                setState(() {
                                  snapshot.data!.docChanges.removeAt(index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Transaction of $name deleted')));
                              });
                            },
                            child: status == widget.tstatus
                                ? _transactions(name, qty, image)
                                : Container());
                      }),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
            ),
          );
        });
  }
}
