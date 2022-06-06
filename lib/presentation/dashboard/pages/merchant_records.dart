// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:shamiri/application/singletons/pending_items_store.dart';
import 'package:shamiri/application/singletons/sliding_tab_status.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_transaction.dart';
import 'package:shamiri/presentation/core/widgets/xplore_loader.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/dashboard_shimmer.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/sliding_tab.dart';
import 'package:shamiri/presentation/dashboard/widgets/molecular/transaction_card.dart';

class MerchantRecords extends StatefulWidget {
  final OrdersStore pendingOrdersStore;

  MerchantRecords({Key? key, required this.pendingOrdersStore})
      : super(key: key);

  @override
  State<MerchantRecords> createState() => _MerchantRecordsState();
}

class _MerchantRecordsState extends State<MerchantRecords> {
  @override
  Widget build(BuildContext context) {
    TransactionRepository transactionRepositoryInstance =
        TransactionRepository();
    SlidingTabStatusStore transactionTabState = SlidingTabStatusStore();

    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(children: <Widget>[
          vSize10SizedBox,
          Container(
            width: double.infinity,
            child: SlidingTabs(
              selectedTab: transactionTabState.activeTabState.value,
              tabs: [
                SlidingTab(
                  key: const ValueKey("TransactionOverview_PendingTab"),
                  title: Text('Cart'),
                ),
                SlidingTab(
                  key: const ValueKey("TransactionOverview_FulfilledTab"),
                  title: Text('Receipts'),
                ),
              ],
              onTabChanged: (v) {
                print('Tab changed to $v');
                setState(() {
                  transactionTabState.activeTabState.add(v ?? 0);
                });
              },
            ),
          ),
          vSize10SizedBox,
          (transactionTabState.activeTabState.value == 0)
              ? Expanded(
                  flex: 1,
                  child: StreamBuilder<dynamic>(
                      stream: transactionRepositoryInstance
                          .getPendingOrdersStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child:
                                  Center(child: Text('Something went wrong')));
                        } else if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.data?.length != 0) {
                          return Container(
                            child: ListView.builder(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                String transactionRefId = snapshot
                                    .data![index].transactionRefId
                                    .toString();
                                widget.pendingOrdersStore.pendingItems
                                    .add([transactionRefId]);

                                String qty = snapshot
                                    .data![index].quantityOrdered
                                    .toString();
                                Product? product =
                                    snapshot.data![index].products;
                                String name = snapshot
                                    .data![index].products!.name
                                    .toString();
                                String price = snapshot
                                    .data![index].products!.sellingPrice
                                    .toString();
                                String image = snapshot
                                    .data![index].products!.imageList![0]
                                    .toString();
                                String date =
                                    snapshot.data![index].date.toString();
                                String status =
                                    snapshot.data![index].status.toString();

                                var amount = price.toUpperCase();
                                var dateParsed =
                                    DateFormat('yyyy-MM-dd HH:mm').parse(date);
                                var dateOrdered =
                                    DateFormat.yMMMd().format(dateParsed);

                                return Transactioncard(
                                  name: name,
                                  quantity: qty,
                                  image: image,
                                  product: product,
                                  amount: amount,
                                  date: dateOrdered,
                                  transactionRefId: transactionRefId,
                                  status: status,
                                );
                              },
                            ),
                          );
                        } else if (snapshot.data?.length == 0) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                XploreLoader(),
                                vSize10SizedBox,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                      'You have no order in your store, kindly add new order to continue',
                                      textAlign: TextAlign.center),
                                )
                              ],
                            ),
                          );
                        }
                        return DashboardShimmer();
                      }),
                )
              : Expanded(
                  flex: 1,
                  child: StreamBuilder<dynamic>(
                      stream: transactionRepositoryInstance
                          .getFulfilledOrdersStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child:
                                  Center(child: Text('Something went wrong')));
                        } else if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.data?.length != 0) {
                          return Container(
                            child: ListView.builder(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                String transactionRefId = snapshot
                                    .data![index].transactionRefId
                                    .toString();
                                String qty = snapshot
                                    .data![index].quantityOrdered
                                    .toString();
                                Product? product =
                                    snapshot.data![index].products;
                                String name = snapshot
                                    .data![index].products!.name
                                    .toString();
                                String price = snapshot
                                    .data![index].products!.sellingPrice
                                    .toString();
                                String image = snapshot
                                    .data![index].products!.imageList![0]
                                    .toString();
                                String date =
                                    snapshot.data![index].date.toString();
                                String status =
                                    snapshot.data![index].status.toString();

                                var amount = price.toUpperCase();
                                var dateParsed =
                                    DateFormat('yyyy-MM-dd HH:mm').parse(date);
                                var dateOrdered =
                                    DateFormat.yMMMd().format(dateParsed);

                                return Transactioncard(
                                  name: name,
                                  quantity: qty,
                                  image: image,
                                  product: product,
                                  amount: amount,
                                  date: dateOrdered,
                                  transactionRefId: transactionRefId,
                                  status: status,
                                );
                              },
                            ),
                          );
                        } else if (snapshot.data?.length == 0) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                XploreLoader(),
                                vSize10SizedBox,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                      'You have no order in your store, kindly add new order to continue',
                                      textAlign: TextAlign.center),
                                )
                              ],
                            ),
                          );
                        }
                        return DashboardShimmer();
                      }),
                ),
        ]));
  }
}
