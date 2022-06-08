// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

// Project imports:
import 'package:shamiri/domain/models/categories/category.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_product.dart';
import 'package:shamiri/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';

class AddProductPage extends StatefulWidget {
  final ProductRepository productRepoInstance;

  const AddProductPage({Key? key, required this.productRepoInstance}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _bp = TextEditingController();
  TextEditingController _sp = TextEditingController();
  TextEditingController _units = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _cat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: XploreColors.xploreOrange,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.8,
            // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: XploreColors.xploreOrange,
              ),
              onPressed: () => Navigator.of(context).pushReplacementNamed(dashPageRoute),
            ),
          ),
        ),
        title: Container(
            height: 39,
            width: MediaQuery.of(context).size.width * 0.7,
            color: Colors.white,
            child: Center(
              child: Text(
                addProductText,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                  color: XploreColors.xploreOrange,
                ),
              ),
            )),
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
                  cursorColor: XploreColors.xploreOrange,
                  decoration: InputDecoration(
                    labelText: productNameText,
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: XploreColors.xploreOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: XploreColors.xploreOrange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: productNameText,
                  ),
                ),
                vSize20SizedBox,
                TextField(
                  controller: _units,
                  cursorColor: XploreColors.xploreOrange,
                  decoration: InputDecoration(
                    labelText: productUnitText,
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: XploreColors.xploreOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: XploreColors.xploreOrange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "e.g Kg, g, Lt",
                  ),
                ),
                vSize20SizedBox,
                TextField(
                  controller: _bp,
                  keyboardType: TextInputType.number,
                  cursorColor: XploreColors.xploreOrange,
                  decoration: InputDecoration(
                    labelText: buyingPriceText,
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: XploreColors.xploreOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: XploreColors.xploreOrange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: priceFromSupplier,
                  ),
                ),
                vSize20SizedBox,
                TextField(
                  controller: _sp,
                  cursorColor: XploreColors.xploreOrange,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: sellingPriceText,
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: XploreColors.xploreOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: XploreColors.xploreOrange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: priceToConsumerText,
                  ),
                ),
                vSize20SizedBox,
                TextField(
                  controller: _qty,
                  cursorColor: XploreColors.xploreOrange,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: qtyInStockText,
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: XploreColors.xploreOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: XploreColors.xploreOrange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: qtyInStockHint,
                  ),
                ),
                vSize20SizedBox,
                TextField(
                  controller: _cat,
                  cursorColor: XploreColors.xploreOrange,
                  decoration: InputDecoration(
                    labelText: categoryText,
                    labelStyle: TextStyle(
                      color: XploreColors.xploreOrange,
                    ),
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: XploreColors.xploreOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: XploreColors.xploreOrange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: categoryHint,
                  ),
                ),
                vSize40SizedBox,
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(XploreColors.xploreOrange),
                    ),
                    onPressed: () {
                      if (_name.text.length > 0 ||
                          _bp.text.length > 0 ||
                          _sp.text.length > 0 ||
                          _units.text.length > 0 ||
                          _qty.text.length > 0 ||
                          _cat.text.length > 0) {
                        var buisinessID = globalFirebaseAuthInstance.currentUser!.uid;

                        final Product newProduct = Product(
                            businessUID: buisinessID,
                            name: _name.text,
                            buyingPrice: _bp.text,
                            sellingPrice: _sp.text,
                            quantityInStock: _qty.text,
                            quantityOrdered: '0',
                            metricUnit: _units.text,
                            categories: [
                              Category(
                                name: _cat.text,
                                businessUID: buisinessID,
                              ),
                            ],
                            imageList: [
                              'https://cdn.mos.cms.futurecdn.net/6t8Zh249QiFmVnkQdCCtHK.jpg',
                            ]);

                        _addNewProduct(newProduct).whenComplete(() {
                          Navigator.pushReplacementNamed(context, dashPageRoute);
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            snackbar(
                              content: invalidProductDetails,
                              label: okText,
                            ),
                          );
                      }
                    },
                    child: Text(addProductText)),
                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
              ]),
        ),
      ),
    );
  }

  Future<void> _addNewProduct(Product newProduct) async {
    await widget.productRepoInstance.addProduct(newProduct).then((docRef) {
      widget.productRepoInstance.updateProductefId(docRef.id);
    });
  }
}
