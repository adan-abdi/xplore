import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_card_main.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_details_bottomsheet.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_receipt_screen.dart';

import '../../../../core/presentation/components/my_lottie.dart';
import '../../../../core/presentation/components/open_bottom_sheet.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';
import '../../domain/model/transaction_types.dart';

class CreditTransactions extends StatefulWidget {
  const CreditTransactions({super.key});

  @override
  State<CreditTransactions> createState() => _CreditTransactionsState();
}

class _CreditTransactionsState extends State<CreditTransactions> {
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
      final creditTransactionsByBuyerId = _authController
          .user.value!.transactions!
          .where((transaction) =>
              transaction.transactionType == TransactionTypes.credit.toString())
          .map((transaction) => transaction.buyerId!)
          .toSet()
          .toList();

      return creditTransactionsByBuyerId.isNotEmpty
          ? SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, mainIndex) {
                final allTransactionsByBuyer = _authController
                    .user.value!.transactions!
                    .where((transaction) =>
                        transaction.buyerId! ==
                            creditTransactionsByBuyerId[mainIndex] &&
                        transaction.transactionType ==
                            TransactionTypes.credit.toString())
                    .toList();

                return TransactionCardMain(
                  buyerId: creditTransactionsByBuyerId[mainIndex],
                  transactionType: TransactionTypes.credit,
                  allTransactionsByBuyer: allTransactionsByBuyer,
                  onTap: () {
                    Get.to(() => TransactionReceiptScreen(
                        allTransactionsByBuyer: allTransactionsByBuyer));
                  },
                );
              }, childCount: creditTransactionsByBuyerId.length)),
            )
          : SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyLottie(
                    lottie: 'assets/general/receipt.json',
                  ),
                  Text("No Items on credit")
                ],
              ),
            );
    });
  }
}
