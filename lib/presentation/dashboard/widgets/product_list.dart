// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:xplore/infrastructure/local/database.dart';
import 'package:xplore/presentation/dashboard/pages/Base.dart';
import 'package:xplore/presentation/dashboard/pages/EditProduct.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  _myCard(BuildContext context, String name, String bp, String sp, String units,
      String quantity, String category, String image, String docId) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: InkWell(
                child: Image.network(image),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => EditProducts(
                          name: name,
                          bp: bp,
                          sp: sp,
                          units: units,
                          quantity: quantity,
                          category: category,
                          docId: docId)));
                }),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$name', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('$quantity Left',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                      Text('$sp KES',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  InkWell(
                    child: Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.deepOrange,
                      child: Center(
                        child: Text(
                          'Order',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      int rem = int.parse(quantity) - 1;
                      Database.checkoutItem(
                              name: name,
                              bp: bp,
                              sp: sp,
                              units: units,
                              quantity: '1',
                              category: category,
                              rem: rem.toString(),
                              image:
                                  'https://cdn.mos.cms.futurecdn.net/6t8Zh249QiFmVnkQdCCtHK.jpg',
                              status: 'pending',
                              docId: docId)
                          .whenComplete(() => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (BuildContext context) => Base())));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Database.readProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(child: Text('Something went wrong')));
          } else if (snapshot.hasData || snapshot.data != null) {
            return GridView.builder(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 9.0 / 10.0,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext ctx, index) {
                //var productInfo = snapshot.data!.docs[index].data()!;
                String docID = snapshot.data!.docs[index].id;
                String name = snapshot.data!.docs[index]["name"];
                String bp = snapshot.data!.docs[index]["buying_price"];
                String sp = snapshot.data!.docs[index]["selling_price"];
                String un = snapshot.data!.docs[index]["units"];
                String cat = snapshot.data!.docs[index]["category"];
                String qty = snapshot.data!.docs[index]["quantity"];
                String image = snapshot.data!.docs[index]["image"];

                return _myCard(
                  context,
                  name,
                  bp,
                  sp,
                  un,
                  qty,
                  cat,
                  image,
                  docID,
                );
              },
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
