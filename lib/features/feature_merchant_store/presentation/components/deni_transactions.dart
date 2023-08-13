import 'package:flutter/material.dart';

import '../../../../core/presentation/components/my_lottie.dart';

class DeniTransactions extends StatefulWidget {
  const DeniTransactions({super.key});

  @override
  State<DeniTransactions> createState() => _DeniTransactionsState();
}

class _DeniTransactionsState extends State<DeniTransactions> {
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
