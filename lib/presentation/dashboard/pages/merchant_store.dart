// Flutter imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_product.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/dashboard_shimmer.dart';
import 'package:shamiri/presentation/dashboard/widgets/molecular/product_card.dart';

class MerchantStore extends StatefulWidget {
  const MerchantStore({Key? key}) : super(key: key);

  @override
  _MerchantStoreState createState() => _MerchantStoreState();
}

class _MerchantStoreState extends State<MerchantStore> {
  @override
  Widget build(BuildContext context) {
    ProductRepository productRepositoryInstance = ProductRepository();

    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(children: <Widget>[
        vSize10SizedBox,
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: productRepositoryInstance.getStream(),
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
                      String buyingPrice = snapshot.data!.docs[index]["buyingPrice"];
                      String sellingPrice = snapshot.data!.docs[index]["sellingPrice"];
                      String quantityInStock = snapshot.data!.docs[index]["quantityInStock"];
                      String imageList = snapshot.data!.docs[index]["imageList"][0];

                      return ProductCard(
                        product: Product(
                          name: name,
                          quantityInStock: quantityInStock,
                          sellingPrice: sellingPrice,
                          buyingPrice: buyingPrice,
                          categories: [],
                          imageList: [imageList],
                          productRefID: docID,
                        ),
                      );
                    },
                  );
                }
                return DashboardShimmer();
              }),
        ),
      ]),
    );
  }
}
