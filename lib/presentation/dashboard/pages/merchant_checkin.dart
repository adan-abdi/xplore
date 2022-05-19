// Flutter imports:
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/presentation/core/widgets/xplore_appbar.dart';
import 'package:shamiri/presentation/core/widgets/xplore_card.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/product_list.dart';
import 'package:shamiri/presentation/dashboard/widgets/transaction_list.dart';

class MerchantCheckIn extends StatefulWidget {
  const MerchantCheckIn({Key? key}) : super(key: key);

  @override
  _MerchantCheckInState createState() => _MerchantCheckInState();
}

class _MerchantCheckInState extends State<MerchantCheckIn> {
  int currentIndex = 0;
  bool isAppbarExpanded = false;

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
    isAppbarExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    // Tabs created to display text on each screen
    final tabs = [
      Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(children: <Widget>[
            vSize10SizedBox,
            Expanded(
              child: ProductList(),
            ),
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(children: <Widget>[
            vSize10SizedBox,
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
            vSize10SizedBox,
            Expanded(
              flex: 1,
              child: sdefault.toString() == 'pending'
                  ? TransactionList(tstatus: sdefault.toString())
                  : TransactionList(tstatus: cdefault.toString()),
            )
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(children: <Widget>[
            Expanded(
              child: Center(child: Text('Settings page!')),
            ),
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
          icon: Icons.qr_code_scanner,
          iconOnPress: () {},
        ),
        lastAction: isAppbarExpanded
            ? XploreIconCard(
                icon: Icons.unfold_less,
                iconOnPress: () {
                  setState(() {
                    isAppbarExpanded = !isAppbarExpanded;
                  });
                },
              )
            : XploreIconCard(
                icon: Icons.unfold_more,
                iconOnPress: () {
                  setState(() {
                    isAppbarExpanded = !isAppbarExpanded;
                  });
                },
              ),
        expanded: isAppbarExpanded,
      ),
      body: tabs[currentIndex],
      //todo: Make mini, reduce widget height
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: XploreColors.deepBlue,
        onPressed: () async {
          await Navigator.pushNamed(context, addProductPageRoute);
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.add),
            Text('Add Product'),
          ],
        ),
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.storefront),
            title: Text('Shop'),
            activeColor: XploreColors.orange,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            title: Text('Transactions'),
            activeColor: XploreColors.lightOrange,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.tune),
            title: Text('Settings'),
            activeColor: XploreColors.lightOrange,
          ),
        ],
      ),
      // TitledBottomNavigationBar(
      //     activeColor: XploreColors.orange,
      //     currentIndex: currentIndex, // Use this to update the Bar giving a position
      //     onTap: (index) {
      //       setBottomBarIndex(index);
      //     },
      //     items: [
      //       TitledNavigationBarItem(
      //         title: Text('Home'),
      //         icon: Icons.home,
      //       ),
      //       TitledNavigationBarItem(
      //         title: Text('Search'),
      //         icon: Icons.search,
      //       ),
      //       // TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
      //     ]),
    );
  }
}
