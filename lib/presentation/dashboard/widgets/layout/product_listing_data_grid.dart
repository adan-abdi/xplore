import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/presentation/dashboard/widgets/molecular/product_card.dart';

class ProductDataGrid extends StatelessWidget {
  final QuerySnapshot<Object?>? snapshotData;

  const ProductDataGrid({Key? key, this.snapshotData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 9.0 / 10.0,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10),
      itemCount: snapshotData!.docs.length,
      itemBuilder: (BuildContext ctx, int index) {
        String docID = snapshotData!.docs[index].id;
        String name = snapshotData!.docs[index]["name"];
        String buyingPrice = snapshotData!.docs[index]["buyingPrice"];
        String sellingPrice = snapshotData!.docs[index]["sellingPrice"];
        String quantityInStock = snapshotData!.docs[index]["quantityInStock"];
        String imageList = snapshotData!.docs[index]["imageList"][0];

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
}
