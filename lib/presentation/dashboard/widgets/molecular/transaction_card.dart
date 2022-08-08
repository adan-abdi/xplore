// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_order.dart';

// ignore: must_be_immutable
class Transactioncard extends StatefulWidget {
  final String ref;
  final String date;
  final String status;
  final String transactionRefId;

  Transactioncard({
    Key? key,
    required this.ref,
    required this.date,
    required this.status,
    required this.transactionRefId,
  }) : super(key: key);

  @override
  State<Transactioncard> createState() => _TransactioncardState();
}

class _TransactioncardState extends State<Transactioncard> {
  Product? product;

  @override
  void initState() {
    super.initState();
    _getOrderProducts(widget.ref);
  }

  TransactionRepository transactionRepositoryInstance = TransactionRepository();
  ProductRepository productRepositoryInstance = ProductRepository();

  @override
  Widget build(BuildContext context) {
    var dateOrdered = widget.date;
    bool isPending = widget.status == "TransactionStatus.pending";

    return FutureBuilder(
        future: _getOrderProducts(widget.ref),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          var newQtyOrdered = snapshot.data?.quantityOrdered ?? '';
          var transactionAmount = snapshot.data?.sellingPrice;
          return Container(
            padding: EdgeInsets.all(0),
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Expanded(
                    flex: 1,
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Container(
                          color: XploreColors.xploreOrange.withOpacity(.3),
                          width: 40,
                          height: 40,
                          child: isPending
                              ? Icon(
                                  Icons.receipt_long,
                                  color: XploreColors.xploreOrange,
                                )
                              : Icon(
                                  Icons.receipt,
                                  color: XploreColors.xploreOrange,
                                )),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "${snapshot.data?.name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          "$dateOrdered",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: XploreColors.deepBlue,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          "KES $transactionAmount",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.status == "TransactionStatus.pending")
                          Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: XploreColors.deepBlue,
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              icon: Icon(
                                Icons.remove,
                                size: 18,
                                color: XploreColors.white,
                              ),
                              onPressed: () async {
                                newQtyOrdered = await decrementOrderQty(
                                    widget.transactionRefId, snapshot.data);
                                setState(() {
                                  snapshot.data.quantityOrdered = newQtyOrdered;
                                });
                              },
                            ),
                          ),
                        CircleAvatar(
                          backgroundColor:
                              XploreColors.xploreOrange.withOpacity(.2),
                          child: Text(
                            snapshot.data.quantityOrdered?.toString() ?? '',
                            style: TextStyle(
                                fontSize: 14, color: XploreColors.deepBlue),
                          ),
                        ),
                        if (widget.status == "TransactionStatus.pending")
                          Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: XploreColors.deepBlue,
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 18,
                                color: XploreColors.white,
                              ),
                              onPressed: () async {
                                newQtyOrdered = await incrementOrderQty(
                                    widget.transactionRefId, snapshot.data);
                                setState(() {
                                  snapshot.data.quantityOrdered = newQtyOrdered;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<String> incrementOrderQty(String transactionRefId, Product pro) async {
    var qtyInStock = int.parse(pro.quantityInStock) - 1;
    var currentQty = int.parse(pro.quantityOrdered ?? '0');
    var newOrderedQty = currentQty + 1;
    var newProduct = Product(
      name: pro.name,
      quantityInStock: qtyInStock.toString(),
      sellingPrice: pro.sellingPrice,
      productRefID: pro.productRefID,
      businessUID: pro.businessUID,
      buyingPrice: pro.buyingPrice,
      categories: pro.categories,
      metricUnit: pro.metricUnit,
      imageList: [],
    );

    await productRepositoryInstance.updateProduct(newProduct);
    await transactionRepositoryInstance.updateorderQty(
        orderRefId: transactionRefId, newQTy: newOrderedQty.toString());
    return newOrderedQty.toString();
  }

  Future<String> decrementOrderQty(String transactionRefId, Product pro) async {
    var currentQty = int.parse(pro.quantityOrdered ?? '0');
    if (currentQty != 0) {
      var qtyInStock = int.parse(pro.quantityInStock) + 1;
      var newOrderedQty = int.parse(pro.quantityOrdered ?? '0') - 1;
      var newProduct = Product(
        name: pro.name,
        quantityInStock: qtyInStock.toString(),
        sellingPrice: pro.sellingPrice,
        productRefID: pro.productRefID,
        businessUID: pro.businessUID,
        buyingPrice: pro.buyingPrice,
        categories: pro.categories,
        metricUnit: pro.metricUnit,
        imageList: [],
      );

      await productRepositoryInstance.updateProduct(newProduct);
      await transactionRepositoryInstance.updateorderQty(
          orderRefId: transactionRefId, newQTy: newOrderedQty.toString());

      return newOrderedQty.toString();
    }
    return currentQty.toString();
  }

  Future<Product> _getOrderProducts(String ref) async {
    product = await productRepositoryInstance.getProductByRef(ref);
    return Future.value(product);
  }
}
