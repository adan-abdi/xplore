import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/dashboard_current_index.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_inventory.dart';
import 'package:shamiri/presentation/core/widgets/xplore_appbar.dart';
import 'package:shamiri/presentation/core/widgets/xplore_card.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/dashboard_shimmer.dart';

// ignore: must_be_immutable
class DashboardScaffold extends StatefulWidget {
  final List<Widget> tabs;
  DashboardIndexStatusStore dashboardIndexStatusStore;

  DashboardScaffold({
    Key? key,
    required this.tabs,
    required this.dashboardIndexStatusStore,
  }) : super(key: key);

  @override
  State<DashboardScaffold> createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  @override
  Widget build(BuildContext context) {
    InventoryRepository inventoryRepository = InventoryRepository();
    String appBarTitle = (widget.dashboardIndexStatusStore.currentIndex == 0) ? 'Merchant Store' : 'Merchant Records';

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: XploreAppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: appBarTitle,
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
      body: StreamBuilder(
          stream: inventoryRepository.getStream(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return widget.tabs[widget.dashboardIndexStatusStore.currentIndex.value];
            }
            return DashboardShimmer();
          }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: XploreColors.deepBlue,
        onPressed: () async {
          await Navigator.pushNamed(context, addProductPageRoute);
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.add_circle,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Add Product',
                style: TextStyle(
                  fontSize: 14,
                )),
          ],
        ),
        enableFeedback: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: widget.dashboardIndexStatusStore.currentIndex.value,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          widget.dashboardIndexStatusStore.currentIndex.value = index;
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
