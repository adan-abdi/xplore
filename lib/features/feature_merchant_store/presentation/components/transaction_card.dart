import 'package:flutter/material.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/features/feature_cart/domain/model/payment_types.dart';
import 'package:shamiri/features/feature_cart/presentation/model/payment_method.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/transaction_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_tag.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../domain/value_objects/app_spaces.dart';
import '../../domain/model/transaction_types.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  final ProductModel product;
  final bool altColors;
  final TransactionTypes transactionType;
  final PaymentTypes transactionPaymentMethod;

  const TransactionCard(
      {super.key,
      required this.transaction,
      required this.product,
      this.altColors = false,
      required this.transactionType,
      required this.transactionPaymentMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: altColors ? XploreColors.deepBlue : XploreColors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  image
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: altColors
                      ? XploreColors.white
                      : XploreColors.deepBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100)),
              child: transactionPaymentMethod == PaymentTypes.mpesa
                  ? Image.asset(
                      'assets/general/mpesa_new.png',
                      fit: BoxFit.contain,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Icon(
                        transactionPaymentMethod == PaymentTypes.cash
                            ? Icons.payments_rounded
                            : Icons.loyalty_rounded,
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
                        Expanded(
                          child: Text(
                            "${product.productName!}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: altColors
                                    ? XploreColors.white
                                    : Colors.black),
                            maxLines: 2,
                          ),
                        ),
                        //  price
                        Text(
                          "Ksh. ${transaction.amountPaid!.toString().addCommas}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: altColors
                                  ? XploreColors.white
                                  : Colors.black),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${product.productCategoryId != null && product.productCategoryId!.isNotEmpty ? product.productCategoryId! : 'No category'}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color:
                                  altColors ? XploreColors.white : Colors.black,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          "${transaction.itemsBought!} items",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: altColors
                                  ? XploreColors.white
                                  : Colors.black),
                        ),
                      ],
                    ),

                    //  date and tags
                    Row(
                      children: [
                        Text(
                          "${transaction.transactionDate!.formatDate}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color:
                                  altColors ? XploreColors.white : Colors.black,
                              overflow: TextOverflow.ellipsis),
                        ),
                        hSize20SizedBox,
                        TransactionTag(
                            title: transactionType == TransactionTypes.fulfilled
                                ? 'Completed'
                                : transactionType == TransactionTypes.pending
                                    ? 'Pending'
                                    : 'Credit',
                            altColors: false,
                            tagColor: transactionType ==
                                    TransactionTypes.fulfilled
                                ? XploreColors.green
                                : transactionType == TransactionTypes.pending
                                    ? XploreColors.red
                                    : XploreColors.xploreOrange)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
