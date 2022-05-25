// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/domain/routes/routes.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final String prodName = product.name.toString();
    final String prodQty = product.quantityInStock.toString();
    final String prodSp = product.sellingPrice.toString();
    final String prodBp = product.buyingPrice.toString();
    final String prodImag = product.imageList!.first.toString();
    final String productRef = product.productRefID.toString();

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 22.0 / 12.0,
            child: InkWell(
                child: Image.network(product.imageList!.first.toString()),
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
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: XploreColors.orange,
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
                      // int rem = int.parse(quantity) - 1;
                      // Database.checkoutItem(
                      //         name: name,
                      //         bp: bp,
                      //         sp: sp,
                      //         units: units,
                      //         quantity: '1',
                      //         category: category,
                      //         rem: rem.toString(),
                      //         image: 'https://cdn.mos.cms.futurecdn.net/6t8Zh249QiFmVnkQdCCtHK.jpg',
                      //         status: 'pending',
                      //         docId: productDocId)
                      //     .whenComplete(() => Navigator.of(context).pushReplacement(
                      //         MaterialPageRoute(builder: (BuildContext context) => MerchantCheckIn())));
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
