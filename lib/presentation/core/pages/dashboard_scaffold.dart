// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/dashboard_current_index.dart';
import 'package:shamiri/application/singletons/pending_items_store.dart';
import 'package:shamiri/application/singletons/product_listing_status.dart';
import 'package:shamiri/application/singletons/search_state.dart';
import 'package:shamiri/domain/routes/routes.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_order.dart';
import 'package:shamiri/presentation/core/widgets/layout/xplore_appbar.dart';
import 'package:shamiri/presentation/core/widgets/molecular/dashboard_tab_action_button.dart';
import 'package:shamiri/presentation/core/widgets/xplore_card.dart';
import 'package:shamiri/presentation/core/widgets/xplore_snackbar.dart';

// ignore: must_be_immutable
class DashboardScaffold extends StatefulWidget {
  final List<Widget> tabs;
  DashboardIndexStatusStore dashboardIndexStatusStore;
  SearchStatus searchStatus;
  ProductListingStatus productListingStatus;
  OrdersStore pendingOrdersStore;
  ProductRepository productRepoInstance;
  TransactionRepository transactionRepository;

  DashboardScaffold({
    Key? key,
    required this.tabs,
    required this.dashboardIndexStatusStore,
    required this.searchStatus,
    required this.productListingStatus,
    required this.pendingOrdersStore,
    required this.productRepoInstance,
    required this.transactionRepository,
  }) : super(key: key);

  @override
  State<DashboardScaffold> createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  bool isAppbarExpanded = false;

  @override
  void initState() {
    super.initState();
    isAppbarExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    int activeTab = widget.dashboardIndexStatusStore.currentIndex.value;
    String appBarTitle = (activeTab == 0) ? 'Merchant Store' : 'Merchant Records';

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                    ScaffoldMessenger.of(context).showSnackBar(snackbar(
                      content: comingSoonText,
                    ));
                  },
                )
              : XploreIconCard(
                  icon: Icons.unfold_more,
                  iconOnPress: () {
                    ScaffoldMessenger.of(context).showSnackBar(snackbar(
                      content: comingSoonText,
                    ));
                  },
                ),
          expanded: isAppbarExpanded,
        ),
        body: widget.tabs[widget.dashboardIndexStatusStore.currentIndex.value],
        floatingActionButton: DashboardTabActionFAB(
          actionIcon: activeTab == 0 ? Icons.add_circle : Icons.receipt,
          actionLabel: activeTab == 0 ? addProducts : fulfillAll,
          onPressed: () async {
            activeTab == 0
                ? await Navigator.pushReplacementNamed(context, addProductPageRoute,
                    arguments: widget.productRepoInstance)
                : await fulfillAllOrders(widget.pendingOrdersStore.pendingItems.value);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: widget.dashboardIndexStatusStore.currentIndex.value,
          onTap: (i) => setState(() => widget.dashboardIndexStatusStore.currentIndex.add(i)),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.storefront),
              title: Text("Store"),
              selectedColor: XploreColors.xploreOrange,
              unselectedColor: XploreColors.deepBlue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.shopping_cart_checkout),
              title: Text("Transactions"),
              selectedColor: XploreColors.xploreOrange,
              unselectedColor: XploreColors.deepBlue,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fulfillAllOrders(List<String> pendingItemsRefIdList) async {
    for (int i = 0; i < int.parse(pendingItemsRefIdList.length.toString()); i++) {
      await widget.transactionRepository.fulfillOrder(pendingItemsRefIdList[i]);
    }
  }
}
