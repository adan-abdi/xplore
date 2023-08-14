import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_card.dart';

import '../../domain/model/transaction_model.dart';
import '../../domain/model/transaction_types.dart';

class Receipt extends StatelessWidget {
  final String userName;
  final String totalPrice;
  final List<TransactionModel> allTransactionsByBuyer;

  const Receipt(
      {super.key,
      required this.userName,
      required this.totalPrice,
      required this.allTransactionsByBuyer});

  TransactionTypes getTransactionType({required int index}) {
    final transaction = allTransactionsByBuyer[index];

    return TransactionTypes.values
        .firstWhere((type) => type.toString() == transaction.transactionType!);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
          width: double.infinity,
          height: 500,
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: XploreColors.deepBlue,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/appIcon/playstore.png",
                                width: 50,
                                height: 50,
                              )),
                          hSize10SizedBox,
                          Text(
                            "Shamiri",
                            style: TextStyle(
                                color: XploreColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: getTransactionType(index: 0) ==
                                    TransactionTypes.fulfilled
                                ? XploreColors.green.withOpacity(0.6)
                                : getTransactionType(index: 0) ==
                                        TransactionTypes.pending
                                    ? XploreColors.red.withOpacity(0.6)
                                    : XploreColors.xploreOrange
                                        .withOpacity(0.6)),
                        child: Text(
                          getTransactionType(index: 0) ==
                                  TransactionTypes.fulfilled
                              ? "Fulfilled"
                              : getTransactionType(index: 0) ==
                                      TransactionTypes.pending
                                  ? "Pending"
                                  : "Credit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: XploreColors.white),
                        ),
                      )
                    ],
                  ),
                  vSize20SizedBox,
                  //  username title
                  Text(
                    userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: XploreColors.white),
                  ),

                  //  user orders
                  vSize20SizedBox,
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final transaction = allTransactionsByBuyer[index];

                          return TransactionCard(
                            transaction: transaction,
                            product: transaction.product!,
                            altColors: true,
                            transactionType: getTransactionType(index: index),
                          );
                        },
                        itemCount: allTransactionsByBuyer.length),
                  ),
                  //  total
                  Divider(
                    height: 5,
                    color: XploreColors.whiteSmoke,
                  ),

                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: XploreColors.whiteSmoke),
                        ),
                        Text(
                          "Ksh. $totalPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: XploreColors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      10,
                      (index) => Container(
                            width: 20,
                            height: 10,
                            margin: index != 9
                                ? const EdgeInsets.only(right: 8)
                                : EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                              color: XploreColors.white,
                            ),
                          )),
                ),
              )
            ],
          )),
    );
  }
}
