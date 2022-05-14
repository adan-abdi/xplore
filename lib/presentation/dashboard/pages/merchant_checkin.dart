// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/presentation/core/widgets/xplore_appbar.dart';
import 'package:shamiri/presentation/core/widgets/xplore_card.dart';
import 'package:shamiri/presentation/dashboard/widgets/category_bar.dart';
import 'package:shamiri/presentation/dashboard/widgets/product_list.dart';
import 'package:shamiri/presentation/dashboard/widgets/transaction_list.dart';

class MerchantCheckIn extends StatefulWidget {
  const MerchantCheckIn({Key? key}) : super(key: key);

  @override
  _MerchantCheckInState createState() => _MerchantCheckInState();
}

class _MerchantCheckInState extends State<MerchantCheckIn> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  late String sdefault;
  String cdefault = 'complete';

  void newDefault(value) {
    setState(() {
      sdefault = value;
    });
  }

  @override
  void initState() {
    super.initState();
    sdefault = 'pending';
  }

  @override
  Widget build(BuildContext context) {
    // Tabs created to display text on each screen

    final tabs = [
      Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(children: <Widget>[
            Container(
              child: Row(
                children: [
                  // CategoryBar(categoryCount: 6,),
                  ...categoryChips(6),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ProductList(),
            ),
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    //setIndex(0);
                    newDefault('pending');
                    //print(sdefault);
                  },
                  child: Container(
                      height: 39,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.deepOrange,
                      child: Center(
                        child: Text(
                          'Pending',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    //setIndex(1);
                    newDefault('complete');
                    //print(sdefault);
                  },
                  child: Container(
                      height: 39,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.deepOrange,
                      child: Center(
                        child: Text(
                          'Fullfilled',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: sdefault.toString() == 'pending'
                  ? TransactionList(tstatus: sdefault.toString())
                  : TransactionList(tstatus: cdefault.toString()),
            )
          ])),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: XploreAppBar(
        title: 'Merchant CheckIn',
        leadingIcon: XploreIconCard(
          icon: Icons.menu,
          iconOnPress: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        firstAction: XploreIconCard(
          icon: Icons.filter_list,
          iconOnPress: () {},
        ),
        lastAction: XploreIconCard(
          icon: Icons.qr_code_scanner,
          iconOnPress: () {},
        ),
        expanded: true,
      ),
      body: tabs[currentIndex],
      //todo: Make mini, reduce widget height
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: XploreColors.deepBlue,
        onPressed: () {},
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.add),
            Text('Add Product'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.grey[100],
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: MediaQuery.of(context).size.width * 0.4, height: 40),
                child: ElevatedButton(
                  clipBehavior: Clip.none,
                  child: Text('Inventory'),
                  onPressed: () {
                    setBottomBarIndex(0);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        currentIndex == 0
                            ? XploreColors.deepBlue
                            : XploreColors.white,
                      ),
                      //padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 20,
                        color: currentIndex == 0
                            ? Colors.white
                            : XploreColors.deepBlue,
                      ))),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: MediaQuery.of(context).size.width * 0.4, height: 40),
                child: ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  child: Text('Transactions'),
                  onPressed: () {
                    setBottomBarIndex(1);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        currentIndex == 1
                            ? XploreColors.deepBlue
                            : XploreColors.deepBlue,
                      ),
                      //padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 20,
                        color: currentIndex == 1
                            ? XploreColors.deepBlue
                            : XploreColors.deepBlue,
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
