// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_transaction.dart';

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
    var transactionAmount = product!.sellingPrice;
    var dateOrdered = widget.date;
    String newQtyOrdered = product!.quantityOrdered ?? '';
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
                    "${product!.name}",
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
                      decoration: BoxDecoration(color: XploreColors.deepBlue, borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          size: 18,
                          color: XploreColors.white,
                        ),
                        onPressed: () async {
                          newQtyOrdered = await decrementOrderQty(widget.transactionRefId);
                          setState(() {
                            product!.quantityOrdered = newQtyOrdered;
                          });
                        },
                      ),
                    ),
                  CircleAvatar(
                    backgroundColor: XploreColors.xploreOrange.withOpacity(.2),
                    child: Text(
                      newQtyOrdered,
                      style: TextStyle(fontSize: 14, color: XploreColors.deepBlue),
                    ),
                  ),
                  if (widget.status == "TransactionStatus.pending")
                    Container(
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: XploreColors.deepBlue, borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 18,
                          color: XploreColors.white,
                        ),
                        onPressed: () async {
                          newQtyOrdered = await incrementOrderQty(widget.transactionRefId);
                          setState(() {
                            product!.quantityOrdered = newQtyOrdered;
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
    var qtyInStock = int.parse(product!.quantityInStock) - 1;
    var currentQty = int.parse(product!.quantityInStock);
    var newOrderedQty = currentQty + 1;
    var newProduct = Product(
      name: product!.name,
      quantityInStock: qtyInStock.toString(),
      sellingPrice: product!.sellingPrice,
      productRefID: product!.productRefID,
      businessUID: product!.businessUID,
      buyingPrice: product!.buyingPrice,
      categories: product!.categories,
      metricUnit: product!.metricUnit,
      imageList: [],
    );

    await productRepositoryInstance.updateProduct(newProduct);
    await transactionRepositoryInstance.updateTransactionQty(
        transactionRefId: transactionRefId, newQTy: newOrderedQty.toString());
    return newOrderedQty.toString();
  }

  Future<String> decrementOrderQty(String transactionRefId) async {
    var currentQty = int.parse(product!.quantityInStock);
    if (currentQty != 0) {
      var qtyInStock = int.parse(product!.quantityInStock) + 1;
      var newOrderedQty = int.parse(product!.quantityOrdered ?? '') - 1;
      var newProduct = Product(
        name: product!.name,
        quantityInStock: qtyInStock.toString(),
        sellingPrice: product!.sellingPrice,
        productRefID: product!.productRefID,
        businessUID: product!.businessUID,
        buyingPrice: product!.buyingPrice,
        categories: product!.categories,
        metricUnit: product!.metricUnit,
        imageList: [],
      );

      await productRepositoryInstance.updateProduct(newProduct);
      await transactionRepositoryInstance.updateTransactionQty(
          transactionRefId: transactionRefId, newQTy: newOrderedQty.toString());

      return newOrderedQty.toString();
    }
    return currentQty.toString();
  }

  Future<void> _getOrderProducts(String ref) async {
    await productRepositoryInstance.getProductByRef(ref).then((p) {
      setState(() {
        product = p;
      });
    });
  }
}
