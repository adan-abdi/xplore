// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:shamiri/application/singletons/sliding_tab_status.dart';
import 'package:shamiri/domain/models/products/product.dart';
import 'package:shamiri/domain/models/transactions/transaction.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_transaction.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/dashboard_shimmer.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/sliding_tab.dart';
import 'package:shamiri/presentation/dashboard/widgets/molecular/transaction_card.dart';

class MerchantRecords extends StatefulWidget {
  const MerchantRecords({Key? key}) : super(key: key);

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
          Expanded(
            flex: 1,
            child: StreamBuilder<List<Order>>(
                stream: transactionRepositoryInstance.getStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Center(child: Text('Something went wrong')));
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return Container(
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext ctx, index) {
                          String qty = snapshot
                              .data![index].productsMap[index].quantityOrdered
                              .toString();
                          Product? product =
                              snapshot.data![index].productsMap[index].product;
                          String name = snapshot
                              .data![index].productsMap[index].product!.name
                              .toString();
                          String price = snapshot.data![index]
                              .productsMap[index].product!.sellingPrice
                              .toString();
                          String image = snapshot.data![index]
                              .productsMap[index].product!.imageList![0]
                              .toString();
                          String date = snapshot
                              .data![index].productsMap[index].date
                              .toString();
                          String transactionRefId =
                              snapshot.data![index].businessUID.toString();

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
                          );
                        },
                      ),
                    );
                  }
                  return DashboardShimmer();
                }),
          )
        ]));
  }
}
