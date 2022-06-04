// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:shamiri/application/core/services/helpers.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/domain/models/transactions/transaction.dart';
import 'package:shamiri/domain/models/transactions/transaction_product.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/domain/value_objects/app_constants.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_transaction.dart';
import 'package:shamiri/presentation/core/pages/dashboard.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    TransactionRepository transactionRepositoryInstance =
        TransactionRepository();
    ProductRepository productRepositoryInstance = ProductRepository();
    final String prodName = widget.product.name.toString();
    final String prodQty = widget.product.quantityInStock.toString();
    final String prodSp = widget.product.sellingPrice.toString();
    final String prodBp = widget.product.buyingPrice.toString();
    final String prodImag = widget.product.imageList!.first.toString();
    final String productRef = widget.product.productRefID.toString();
    final String businessUID = widget.product.productRefID.toString();
    final int rem = int.parse(prodQty) - 1;
    final Product newProduct = Product(
      name: prodName,
      quantityInStock: rem.toString(),
      sellingPrice: prodSp,
      buyingPrice: prodBp,
      imageList: [prodImag],
      productRefID: productRef,
      businessUID: businessUID,
    );

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: XploreColors.xploreOrange.withOpacity(.3),
            child: AspectRatio(
              aspectRatio: 22.0 / 12.0,
              child: InkWell(
                  child: Icon(
                    Icons.inventory,
                    color: XploreColors.deepBlueAccent,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      editProductPageRoute,
                      arguments: Product(
                        name: prodName,
                        quantityInStock: prodQty,
                        sellingPrice: prodSp,
                        buyingPrice: prodBp,
                        categories: [],
                        imageList: [prodImag],
                        productRefID: productRef,
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$prodName',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('$prodQty Left',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                      Text('$prodSp KES',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  InkWell(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: XploreColors.xploreOrange,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Order',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            hSize10SizedBox,
                            Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 21,
                              color: XploreColors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      var now = DateTime.now();
                      final format = DateFormat('yyyy-MM-dd HH:mm');
                      var date = format.format(now);

                      productRepositoryInstance.updateProduct(newProduct);
                      transactionRepositoryInstance
                          .recordTransaction(
                        Order(
                          businessUID: businessUID,
                          status: TransactionStatus.pending,
                          transactionRefId: productRef,
                          productsMap: [
                            TransactionProduct(
                              product: newProduct,
                              date: date,
                              businessUID: businessUID,
                              quantityOrdered: 1,
                            )
                          ],
                          date: date,
                        ),
                      )
                          .whenComplete(() {
                        setState(() {
                          globalDashIndex.currentIndex.add(1);
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(orderAdded),
                                duration: const Duration(
                                    seconds: kShortSnackBarDuration),
                                action: dismissSnackBar(
                                    okText, XploreColors.white, context),
                              ),
                            );
                        });
                      });
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
}
