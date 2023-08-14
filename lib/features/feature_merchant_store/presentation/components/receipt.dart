import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_card.dart';

import '../../domain/model/transaction_model.dart';
import '../../domain/model/transaction_types.dart';

class Receipt extends StatelessWidget {

  final String userName;
  final List<TransactionModel> allTransactionsByBuyer;

  const Receipt({super.key, required this.userName, required this.allTransactionsByBuyer});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
          width: double.infinity,
          height: 450,
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
                  vSize20SizedBox,
                  //  order confirmed title
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "Order Confirmed!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: XploreColors.white),
                    ),
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
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          final transaction = allTransactionsByBuyer[index];

                          return TransactionCard(
                            transaction: transaction,
                            product: transaction.product!,
                            altColors: true,
                            transactionType: TransactionTypes.values.firstWhere(
                                    (type) =>
                                type.toString() == transaction.transactionType!),
                          );
                        },
                        itemCount: allTransactionsByBuyer.length),
                  ),
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
                            margin: index != 9 ? const EdgeInsets.only(right: 8) : EdgeInsets.zero,
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
