import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/presentation/core/widgets/xplore_appbar.dart';
import 'package:shamiri/presentation/core/widgets/xplore_card.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';

// ignore: must_be_immutable
class DashboardScaffold extends StatefulWidget {
  final List<Widget> tabs;
  int currentIndex;

  DashboardScaffold({
    Key? key,
    required this.tabs,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  State<DashboardScaffold> createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  @override
  Widget build(BuildContext context) {
    String appBarTitle = (widget.currentIndex == 0) ? 'Merchant Store' : 'Merchant Records';

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: XploreAppBar(
        title: appBarTitle,
        centerTitle: true,
        firstAction: XploreIconCard(
          icon: Icons.qr_code_scanner,
          iconOnPress: () {
            ScaffoldMessenger.of(context).showSnackBar(snackbar(
              content: comingSoonText,
            ));
          },
        ),
        expanded: false,
      ),
      body: widget.tabs[widget.currentIndex],
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
        selectedIndex: widget.currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          widget.currentIndex = index;
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
        ],
      ),
    );
  }
}
