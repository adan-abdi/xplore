import 'package:flutter/material.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_card.dart';

import '../../domain/model/transaction_model.dart';
import 'package:get/get.dart';

import '../../domain/model/transaction_types.dart';

class TransactionDetailsBottomSheet extends StatefulWidget {
  final List<TransactionModel> allTransactionsByBuyer;

  const TransactionDetailsBottomSheet(
      {super.key,
      required this.allTransactionsByBuyer});

  @override
  State<TransactionDetailsBottomSheet> createState() =>
      _TransactionDetailsBottomSheetState();
}

class _TransactionDetailsBottomSheetState
    extends State<TransactionDetailsBottomSheet> {
  late final HomeController _homeController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();
  }

  String getUserName() {
    final userName =
        widget.allTransactionsByBuyer[0].buyerId!.split(" ").toList()[0] ==
                'customer'
            ? 'Unknown'
            : _homeController.stores
                .firstWhere((store) =>
                    store.userId! == widget.allTransactionsByBuyer[0].buyerId!)
                .userName!;

    return userName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            "Receipts for ${getUserName()}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          vSize20SizedBox,
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  final transaction = widget.allTransactionsByBuyer[index];

                  return TransactionCard(
                    transaction: transaction,
                    product: transaction.product!,
                    transactionType: TransactionTypes.values.firstWhere(
                        (type) =>
                            type.toString() == transaction.transactionType!),
                  );
                },
                itemCount: widget.allTransactionsByBuyer.length),
          ),
        ],
      ),
    );
  }
}
