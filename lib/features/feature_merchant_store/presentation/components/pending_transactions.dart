import 'package:flutter/material.dart';

class PendingTransactions extends StatefulWidget {
  const PendingTransactions({super.key});

  @override
  State<PendingTransactions> createState() => _PendingTransactionsState();
}

class _PendingTransactionsState extends State<PendingTransactions> {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Text("Pending transactions"),
    );
  }
}
