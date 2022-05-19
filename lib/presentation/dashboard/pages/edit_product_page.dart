// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/domain/models/categories/category.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_auth.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_product.dart';

class EditProducts extends StatefulWidget {
  final Product product;

  const EditProducts({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  _EditProductsState createState() => _EditProductsState();
}

class _EditProductsState extends State<EditProducts> {
  TextEditingController _name = TextEditingController();
  TextEditingController _bp = TextEditingController();
  TextEditingController _sp = TextEditingController();
  TextEditingController _units = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _cat = TextEditingController();
  var remoteProductRepoInstance = ProductRepository();

  @override
  void initState() {
    super.initState();
    _name = new TextEditingController(text: widget.product.name);
    _bp = new TextEditingController(text: widget.product.buyingPrice);
    _sp = new TextEditingController(text: widget.product.sellingPrice);
    _units = new TextEditingController(text: widget.product.metricUnit);
    _qty = new TextEditingController(text: widget.product.quantityInStock);
    _cat = new TextEditingController(text: widget.product.categories!.first.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Edit Product"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                remoteProductRepoInstance
                    .deleteProduct(widget.product.productRefID)
                    .whenComplete(() => Navigator.of(context).pop());
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true, // this is new
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _name,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.deepOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "Product Name",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _units,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    labelText: 'Product Units',
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.deepOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "Units",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _bp,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Buying Price',
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.deepOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "Buying Price",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _sp,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Selling Price',
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.deepOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "Selling Price",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _qty,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.deepOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "Quantity in Stock",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _cat,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    labelText: 'Product Category',
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "Category",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          var buisinessID =
                              globalFirebaseAuthInstance.currentUser!.uid;

                          final Product newProduct = Product(
                              businessUID: buisinessID,
                              productRefID: widget.product.productRefID,
                              name: _name.text,
                              buyingPrice: _bp.text,
                              sellingPrice: _sp.text,
                              quantityInStock: _qty.text,
                              metricUnit: _units.text,
                              categories: [
                                Category(
                                    name: _cat.text, businessUID: buisinessID),
                              ],
                              imageList: [
                                widget.product.imageList!.first,
                              ]);

                          remoteProductRepoInstance
                              .addProduct(newProduct)
                              .whenComplete(() => Navigator.of(context).pop());
                        },
                        child: Text('Save Product')),
                  ],
                ),
                Padding(
                    // this is new
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ]),
        ),
      ),
    );
  }
}
