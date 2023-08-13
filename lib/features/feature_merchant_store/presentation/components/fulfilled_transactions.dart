import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_card.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_tile.dart';

class FulfilledTransactions extends StatefulWidget {
  const FulfilledTransactions({super.key});

  @override
  State<FulfilledTransactions> createState() => _FulfilledTransactionsState();
}

class _FulfilledTransactionsState extends State<FulfilledTransactions> {
  late final HomeController _homeController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _authController.user.value!.transactions!.isNotEmpty
          ? SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final userDetails = _homeController.stores.firstWhere((store) =>
                    store.userId! ==
                    _authController.user.value!.transactions![index].buyerId);

                final transaction =
                    _authController.user.value!.transactions![index];

                return TransactionTile(
                    isFirst: index == 0 ? true : false,
                    isLast: index ==
                            _authController.user.value!.transactions!.length - 1
                        ? true
                        : false,
                    isPast: true,
                    iconData: Icons.date_range,
                    content: TransactionCard(
                      transaction: transaction,
                      userDetails: userDetails,
                      product: transaction.product!,
                    ));
              }, childCount: _authController.user.value!.transactions!.length)),
            )
          : SliverFillRemaining(
              child: Center(
                child: Text("No fulfilled transactions"),
              ),
            ),
    );
  }
}
