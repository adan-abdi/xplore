// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/domain/models/transactions/transaction.dart';
import 'package:shamiri/domain/models/transactions/transaction_product.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_transaction.dart';

class Transactioncard extends StatefulWidget {
  final String name;
  final String quantity;
  final String date;
  final String amount;
  final String? image;
  final Product? product;
  final String transactionRefId;

  Transactioncard({
    Key? key,
    required this.name,
    required this.quantity,
    required this.date,
    required this.amount,
    this.image,
    this.product,
    required this.transactionRefId,
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
                    child: Icon(
                      Icons.receipt_long,
                      color: XploreColors.xploreOrange,
                    )
                    // : Image.network(widget.image!),
                    ),
              ),
            ),
          ),
          // hSize20SizedBox,
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
          // hSize20SizedBox,
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: XploreColors.deepBlue, borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 18,
                        color: XploreColors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          incrementOrderQty(widget.transactionRefId);
                        });
                      },
                    ),
                  ),
                  Text(
                    widget.quantity,
                    style: TextStyle(fontSize: 14),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: XploreColors.deepBlue, borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 18,
                        color: XploreColors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          decrementOrderQty(widget.transactionRefId);
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

  void incrementOrderQty(String transactionRefId) {
    var qtyInStock = int.parse(widget.product!.quantityInStock!) - 1;
    var newOrderedQty = int.parse(widget.quantity) + 1;
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

    productRepositoryInstance.updateProduct(newProduct);
    transactionRepositoryInstance.updateTransaction(
      Order(
        businessUID: newProduct.businessUID,
        status: TransactionStatus.pending,
        date: widget.date,
        transactionRefId: transactionRefId,
        productsMap: [
          TransactionProduct(
            product: widget.product,
            transactionProductRefId: widget.product!.productRefID,
            date: widget.date,
            businessUID: widget.product!.businessUID,
            quantityOrdered: newOrderedQty,
          )
        ],
      ),
    );
  }

  void decrementOrderQty(String transactionRefId) {
    var qtyInStock = int.parse(widget.product!.quantityInStock!) + 1;
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

    productRepositoryInstance.updateProduct(newProduct);
    transactionRepositoryInstance.updateTransaction(
      Order(
        businessUID: newProduct.businessUID,
        status: TransactionStatus.pending,
        date: widget.date,
        transactionRefId: transactionRefId,
        productsMap: [
          TransactionProduct(
            product: widget.product,
            transactionProductRefId: widget.product!.productRefID,
            date: widget.date,
            businessUID: widget.product!.businessUID,
            quantityOrdered: newOrderedQty,
          )
        ],
      ),
    );
  }
}
