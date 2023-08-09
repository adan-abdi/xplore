import 'package:flutter/material.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_tile.dart';
import 'package:timeline_tile/timeline_tile.dart';

class FulfilledTransactions extends StatefulWidget {
  const FulfilledTransactions({super.key});

  @override
  State<FulfilledTransactions> createState() => _FulfilledTransactionsState();
}

class _FulfilledTransactionsState extends State<FulfilledTransactions> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => TransactionTile(
                  isFirst: index == 0 ? true : false,
                  isLast: index == 19 ? true : false,
                  isPast: false,
                  iconData: Icons.date_range,
                  content: Container()),
              childCount: 20)),
    );
  }
}
