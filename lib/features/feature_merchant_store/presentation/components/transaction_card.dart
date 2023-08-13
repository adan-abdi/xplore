import 'package:flutter/material.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/transaction_model.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../domain/value_objects/app_spaces.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  final UserModel userDetails;
  final ProductModel product;

  const TransactionCard(
      {super.key,
      required this.transaction,
      required this.userDetails,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //  user name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${userDetails.userName}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "+ Ksh. ${transaction.amountPaid.toString().addCommas}",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: XploreColors.xploreOrange),
              ),
            ],
          ),

          vSize20SizedBox,

          //  product bought
          Container(
            width: double.infinity,
            height: 80,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: XploreColors.deepBlue),
            child: Row(
              children: [
                //  image
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: XploreColors.xploreOrange,
                      borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: product.productImageUrl != null &&
                            product.productImageUrl!.isNotEmpty
                        ? Image.network(
                            product.productImageUrl!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.add_shopping_cart_rounded,
                            color: XploreColors.white,
                          ),
                  ),
                ),

                //  product name
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.productName!}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: XploreColors.white),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${transaction.transactionDate!.formatDate}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: XploreColors.white,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                  "${transaction.itemsBought!} items",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: XploreColors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
