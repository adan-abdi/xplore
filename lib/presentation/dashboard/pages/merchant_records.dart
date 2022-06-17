// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:shamiri/application/redux/actions/dashboard_actions.dart';
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/application/singletons/pending_items_store.dart';
import 'package:shamiri/application/singletons/sliding_tab_status.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/domain/value_objects/app_widget_keys.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_product.dart';
import 'package:shamiri/infrastructure/remote_repository/inventory/firestore_transaction.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/sliding_tab.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/transaction_tab.dart';

class MerchantRecords extends StatefulWidget {
  final OrdersStore pendingOrdersStore;

  MerchantRecords({Key? key, required this.pendingOrdersStore})
      : super(key: key);

  @override
  State<MerchantRecords> createState() => _MerchantRecordsState();
}

class _MerchantRecordsState extends State<MerchantRecords> {
  ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    TransactionRepository transactionRepositoryInstance =
        TransactionRepository();
    SlidingTabStatusStore transactionTabState = SlidingTabStatusStore();

    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromState(store.state),
      builder: (context, vm) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: <Widget>[
              vSize10SizedBox,
              Container(
                width: double.infinity,
                child: SlidingTabs(
                  selectedTab: vm.activeTab,
                  tabs: [
                    SlidingTab(
                      key: transactionCartKey,
                      title: Text(cartText),
                    ),
                    SlidingTab(
                      key: transactionReceiptsKey,
                      title: Text(receiptsText),
                    ),
                  ],
                  onTabChanged: (v) {
                    StoreProvider.dispatch(
                        context, DashboardAction(activeOrderTab: v ?? 0));
                  },
                ),
              ),
              vSize10SizedBox,
              (transactionTabState.activeTabState.value == 0)
                  ? TransactionTab(
                      tabType: TransactionTabs.cart,
                      orderStream: transactionRepositoryInstance
                          .getPendingOrdersStream(),
                      ordersStore: widget.pendingOrdersStore,
                    )
                  : TransactionTab(
                      tabType: TransactionTabs.receipts,
                      orderStream: transactionRepositoryInstance
                          .getFulfilledOrdersStream(),
                      ordersStore: widget.pendingOrdersStore,
                    )
            ],
          ),
        );
      },
    );
  }
}

class _ViewModel with EquatableMixin {
  final int? activeTab;

  _ViewModel.fromState(
    AppState state,
  ) : activeTab = state.dashboardState!.activeTransactionTab;

  @override
  List<Object?> get props => [
        activeTab,
      ];
}
