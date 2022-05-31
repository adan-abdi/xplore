// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/dashboard_current_index.dart';
import 'package:shamiri/application/singletons/product_listing_status.dart';
import 'package:shamiri/application/singletons/search_state.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/infrastructure/remote_repository/firebase_inventory.dart';
import 'package:shamiri/presentation/core/widgets/layout/xplore_appbar.dart';
import 'package:shamiri/presentation/core/widgets/molecular/dashboard_tab_action_button.dart';
import 'package:shamiri/presentation/core/widgets/xplore_card.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/dashboard_shimmer.dart';

// ignore: must_be_immutable
class DashboardScaffold extends StatefulWidget {
  final List<Widget> tabs;
  DashboardIndexStatusStore dashboardIndexStatusStore;
  SearchStatus searchStatus;
  ProductListingStatus productListingStatus;

  DashboardScaffold({
    Key? key,
    required this.tabs,
    required this.dashboardIndexStatusStore,
    required this.searchStatus,
    required this.productListingStatus,
  }) : super(key: key);

  @override
  State<DashboardScaffold> createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  bool isAppbarExpanded = false;

  @override
  void initState() {
    super.initState();
    isAppbarExpanded = !kDebugMode;
  }

  @override
  Widget build(BuildContext context) {
    InventoryRepository inventoryRepository = InventoryRepository();
    int activeTab = widget.dashboardIndexStatusStore.currentIndex.value;
    String appBarTitle =
        (activeTab == 0) ? 'Merchant Store' : 'Merchant Records';

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: XploreAppBar(
        productListingStatus: widget.productListingStatus,
        searchStatus: widget.searchStatus,
        leadingIcon: XploreIconCard(
          icon: Icons.menu,
          iconOnPress: () {},
        ),
        centerTitle: true,
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
        lastAction: isAppbarExpanded
            ? XploreIconCard(
                icon: Icons.unfold_less,
                iconOnPress: () {
                  // setState(() {
                  //   // isAppbarExpanded = !isAppbarExpanded;
                  // });
                },
              )
            : XploreIconCard(
                icon: Icons.unfold_more,
                iconOnPress: () {
                  // setState(() {
                  //   isAppbarExpanded = !isAppbarExpanded;
                  // });
                },
              ),
        expanded: isAppbarExpanded,
      ),
      body: StreamBuilder(
          stream: inventoryRepository.getStream(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return widget
                  .tabs[widget.dashboardIndexStatusStore.currentIndex.value];
            }
            return DashboardShimmer();
          }),
      floatingActionButton: DashboardTabActionFAB(
        actionIcon: activeTab == 0 ? Icons.add_circle : Icons.receipt,
        actionLabel: activeTab == 0 ? addProducts : fulfillAll,
        onPressed: () async {
          activeTab == 0
              ? await Navigator.pushReplacementNamed(
                  context, addProductPageRoute)
              : print('Fulfill all pressed');
        },
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