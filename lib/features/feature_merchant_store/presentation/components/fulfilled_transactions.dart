import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/presentation/components/open_bottom_sheet.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_card.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_card_main.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_details_bottomsheet.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_tile.dart';

import '../../../../core/presentation/components/my_lottie.dart';

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
    return Obx(() {
      final transactionsByBuyerId = _authController.user.value!.transactions!
          .map((transaction) => transaction.buyerId!)
          .toSet()
          .toList();

      return _authController.user.value!.transactions!.isNotEmpty
          ? SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, mainIndex) {
                final allTransactionsByBuyer = _authController
                    .user.value!.transactions!
                    .where((transaction) =>
                        transaction.buyerId! ==
                        transactionsByBuyerId[mainIndex])
                    .toList();

                return TransactionCardMain(
                  buyerId: transactionsByBuyerId[mainIndex],
                  onTap: () {
                    openBottomSheet(
                        content: TransactionDetailsBottomSheet(
                          allTransactionsByBuyer: allTransactionsByBuyer,
                        ),
                        onComplete: () {});
                  },
                );
              }, childCount: transactionsByBuyerId.length)),
            )
          : SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyLottie(
                    lottie: 'assets/general/receipt.json',
                  ),
                  Text("No loans yet.")
                ],
              ),
            );
    });
  }
}
