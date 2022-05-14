// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shamiri/infrastructure/local_repository/database.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
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
        backgroundColor: Colors.deepOrange,
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
                color: Colors.deepOrange,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        title: Container(
            height: 39,
            width: MediaQuery.of(context).size.width * 0.7,
            color: Colors.white,
            child: Center(
              child: Text(
                'Add Product',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.deepOrange),
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
                  cursorColor: Colors.deepOrange,
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
                        color: Colors.deepOrange,
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
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelText: 'Product Unit',
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
                        color: Colors.deepOrange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "e.g Kg, g",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _bp,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.deepOrange,
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
                        color: Colors.deepOrange,
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
                  cursorColor: Colors.deepOrange,
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
                        color: Colors.deepOrange,
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
                  cursorColor: Colors.deepOrange,
                  keyboardType: TextInputType.number,
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
                        color: Colors.deepOrange,
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
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelText: 'Category',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                    ),
                    contentPadding: EdgeInsets.all(5.0),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.deepOrange, width: 2.0),
                      borderRadius: BorderRadius.zero,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.deepOrange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    hintText: "Product Category",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepOrange),
                    ),
                    onPressed: () {
                      Database.addProduct(
                              name: _name.text,
                              bp: _bp.text,
                              sp: _sp.text,
                              units: _units.text,
                              quantity: _qty.text,
                              category: _cat.text,
                              image:
                                  'https://cdn.mos.cms.futurecdn.net/6t8Zh249QiFmVnkQdCCtHK.jpg')
                          .whenComplete(() => Navigator.of(context).pop());
                    },
                    child: Text('Add Product')),
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
