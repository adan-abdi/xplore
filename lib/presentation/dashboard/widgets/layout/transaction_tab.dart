// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:shamiri/application/singletons/pending_items_store.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/dashboard_shimmer.dart';
import 'package:shamiri/presentation/dashboard/widgets/molecular/empty_order_tab.dart';
import 'package:shamiri/presentation/dashboard/widgets/molecular/transaction_card.dart';

class TransactionTab extends StatefulWidget {
  final TransactionTabs tabType;
  final Stream<dynamic>? orderStream;
  final OrdersStore ordersStore;

  const TransactionTab({
    Key? key,
    required this.tabType,
    this.orderStream,
    required this.ordersStore,
  }) : super(key: key);

  @override
  State<TransactionTab> createState() => _TransactionTabState();
}

class _TransactionTabState extends State<TransactionTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: StreamBuilder<dynamic>(
          stream: widget.orderStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(child: Text('Something went wrong')));
            } else if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data?.length != 0) {
              return Container(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    String transactionRefId =
                        snapshot.data![index].orderRefId.toString();
                    widget.ordersStore.pendingItems.add([transactionRefId]);

                    List<String>? productRef = snapshot.data![index].products;

                    assert(productRef != null);

                    var date = snapshot.data[index].date.toString();
                    var status = snapshot.data[index].status.toString();
                    var dateParsed = DateFormat('yyyy-MM-dd HH:mm').parse(date);
                    var dateOrdered = DateFormat.yMMMd().format(dateParsed);

                    return Transactioncard(
                      ref: productRef!.first,
                      date: dateOrdered,
                      status: status,
                      transactionRefId: transactionRefId,
                    );
                  },
                ),
              );
            } else if (snapshot.data?.length == 0) {
              return EmptyOrder();
            }
            return DashboardShimmer();
          }),
    );
  }
}
