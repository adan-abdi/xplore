// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/presentation/dashboard/pages/edit_product_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 22.0 / 12.0,
            child: InkWell(
                child: Image.network(product.imageList!.first),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => EditProducts(
                            product: Product(
                              name: product.name,
                              quantityInStock: product.quantityInStock,
                              sellingPrice: product.sellingPrice,
                              buyingPrice: product.buyingPrice,
                              categories: [],
                              imageList: [product.imageList!.first],
                              productRefID: product.productRefID,
                            ),
                          )));
                }),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$product.name', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('$product.quantity Left', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                      Text('$product.sellingPrice KES',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  InkWell(
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.deepOrange,
                      child: Center(
                        child: Text(
                          'Order',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
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
