// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_transaction.dart';

// ignore: must_be_immutable
class Transactioncard extends StatefulWidget {
  final String name;
  String quantity;
  final String date;
  final String amount;
  final String? image;
  final Product? product;
  final String transactionRefId;
  final String status;

  Transactioncard({
    Key? key,
    required this.name,
    required this.quantity,
    required this.date,
    required this.amount,
    this.image,
    this.product,
    required this.transactionRefId,
    required this.status,
  }) : super(key: key);

  @override
  State<Transactioncard> createState() => _TransactioncardState();
}

class _TransactioncardState extends State<Transactioncard> {
  TransactionRepository transactionRepositoryInstance = TransactionRepository();
  ProductRepository productRepositoryInstance = ProductRepository();

  @override
  Widget build(BuildContext context) {
    var transactionAmount = widget.amount;
    var dateOrdered = widget.date;
    var newQty = widget.quantity;
    bool isPending = widget.status == "TransactionStatus.pending";
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
                    "${widget.name}",
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
                          newQty =
                              await decrementOrderQty(widget.transactionRefId);
                          setState(() {
                            widget.quantity = newQty;
                          });
                        },
                      ),
                    ),
                  CircleAvatar(
                    backgroundColor: XploreColors.xploreOrange.withOpacity(.2),
                    child: Text(
                      newQty,
                      style:
                          TextStyle(fontSize: 14, color: XploreColors.deepBlue),
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
                          newQty =
                              await incrementOrderQty(widget.transactionRefId);
                          setState(() {
                            widget.quantity = newQty;
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
  }

  Future<String> incrementOrderQty(String transactionRefId) async {
    var qtyInStock = int.parse(widget.product!.quantityInStock) - 1;
    var currentQty = int.parse(widget.quantity);
    var newOrderedQty = currentQty + 1;
    var newProduct = Product(
      name: widget.name,
      quantityInStock: qtyInStock.toString(),
      sellingPrice: widget.amount,
      productRefID: widget.product!.productRefID,
      businessUID: widget.product!.businessUID,
      buyingPrice: widget.product!.buyingPrice,
      categories: widget.product!.categories,
      imageList: [],
      metricUnit: widget.product!.metricUnit,
    );

    await productRepositoryInstance.updateProduct(newProduct);
    await transactionRepositoryInstance.updateTransactionQty(
        transactionRefId: transactionRefId, newQTy: newOrderedQty.toString());
    return newOrderedQty.toString();
  }

  Future<String> decrementOrderQty(String transactionRefId) async {
    var currentQty = int.parse(widget.quantity);
    if (currentQty != 0) {
      var qtyInStock = int.parse(widget.product!.quantityInStock) + 1;
      var newOrderedQty = int.parse(widget.quantity) - 1;
      var newProduct = Product(
        name: widget.name,
        quantityInStock: qtyInStock.toString(),
        sellingPrice: widget.amount,
        productRefID: widget.product!.productRefID,
        businessUID: widget.product!.businessUID,
        buyingPrice: widget.product!.buyingPrice,
        categories: widget.product!.categories,
        imageList: [],
        metricUnit: widget.product!.metricUnit,
      );

      await productRepositoryInstance.updateProduct(newProduct);
      await transactionRepositoryInstance.updateTransactionQty(
          transactionRefId: transactionRefId, newQTy: newOrderedQty.toString());

      return newOrderedQty.toString();
    }
    return currentQty.toString();
  }
}
