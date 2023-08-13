import 'package:flutter/material.dart';

import '../../../../core/presentation/components/my_lottie.dart';

class CreditTransactions extends StatefulWidget {
  const CreditTransactions({super.key});

  @override
  State<CreditTransactions> createState() => _CreditTransactionsState();
}

class _CreditTransactionsState extends State<CreditTransactions> {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
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
  }
}
