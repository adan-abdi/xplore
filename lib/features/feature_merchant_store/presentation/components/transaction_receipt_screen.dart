import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/receipt.dart';

import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';
import '../../domain/model/transaction_model.dart';

class TransactionReceiptScreen extends StatefulWidget {
  final List<TransactionModel> allTransactionsByBuyer;

  const TransactionReceiptScreen(
      {super.key, required this.allTransactionsByBuyer});

  @override
  State<TransactionReceiptScreen> createState() =>
      _TransactionReceiptScreenState();
}

class _TransactionReceiptScreenState extends State<TransactionReceiptScreen> {
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
                    store.userId! ==
                    widget.allTransactionsByBuyer[0].buyerId!
                        .split(" ")
                        .toList()[0])
                .userName!;

    return userName;
  }

  int getTotalPrice() {
    final allTransactionsPrice = _authController.user.value!.transactions!
        .where((transaction) =>
            transaction.buyerId! ==
            widget.allTransactionsByBuyer[0].buyerId!.split(" ").toList()[0])
        .map((transaction) => transaction.amountPaid!)
        .reduce((value, element) => value + element);

    return allTransactionsPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: XploreColors.white,
            systemNavigationBarColor: XploreColors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        backgroundColor: XploreColors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_rounded, color: XploreColors.deepBlue)),
        elevation: 0,
        title: Text(
          "Receipt",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  receipt
              Receipt(
                userName: getUserName(),
                totalPrice: getTotalPrice().toString().addCommas,
                allTransactionsByBuyer: widget.allTransactionsByBuyer,
              )
            ],
          )),
    );
  }
}
