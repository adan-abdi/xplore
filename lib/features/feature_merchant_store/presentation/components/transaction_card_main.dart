import 'package:flutter/material.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_tag.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../domain/value_objects/app_spaces.dart';
import 'package:get/get.dart';

import '../../../feature_home/presentation/controller/home_controller.dart';

class TransactionCardMain extends StatefulWidget {
  final String buyerId;
  final VoidCallback onTap;

  const TransactionCardMain(
      {super.key, required this.buyerId, required this.onTap});

  @override
  State<TransactionCardMain> createState() => _TransactionCardMainState();
}

class _TransactionCardMainState extends State<TransactionCardMain> {
  late final AuthController _authController;
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
    _homeController = Get.find<HomeController>();
  }

  String getUserName() {
    final userName = widget.buyerId.split(" ").toList()[0] == 'customer'
        ? 'Unknown'
        : _homeController.stores
            .firstWhere((store) => store.userId! == widget.buyerId)
            .userName!;

    return userName;
  }

  int getTotalPrice() {
    final allTransactionsPrice = _authController.user.value!.transactions!
        .where((transaction) => transaction.buyerId! == widget.buyerId)
        .map((transaction) => transaction.amountPaid!)
        .reduce((value, element) => value + element);

    return allTransactionsPrice;
  }

  int getTotalItemsBought() {
    final allTransactionsItemsBought = _authController.user.value!.transactions!
        .where((transaction) => transaction.buyerId! == widget.buyerId)
        .map((transaction) => transaction.itemsBought!)
        .reduce((value, element) => value + element);

    return allTransactionsItemsBought;
  }

  String getDateOfPurchase() {
    final transactionDate = _authController.user.value!.transactions!
        .firstWhere((transaction) => transaction.buyerId! == widget.buyerId);

    return transactionDate.transactionDate.toString().formatDate;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: XploreColors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  image
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: XploreColors.deepBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Icon(
                    Icons.receipt_long_rounded,
                    color: XploreColors.deepBlue,
                    size: 24,
                  ),
                ),
              ),

              hSize10SizedBox,

              //  product name
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  name and price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${getUserName()}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          //  price
                          Text(
                            "Ksh. ${getTotalPrice().toString().addCommas}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No category",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            "${getTotalItemsBought()} items",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),

                      //  date and tags
                      Row(
                        children: [
                          Text(
                            "${getDateOfPurchase()}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis),
                          ),
                          hSize20SizedBox,
                          TransactionTag(
                              title: "fulfilled", tagColor: XploreColors.red)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
