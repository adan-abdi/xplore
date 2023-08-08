import 'package:flutter/material.dart';

class FulfilledTransactions extends StatefulWidget {
  const FulfilledTransactions({super.key});

  @override
  State<FulfilledTransactions> createState() => _FulfilledTransactionsState();
}

class _FulfilledTransactionsState extends State<FulfilledTransactions> {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Text("Fulfilled transactions"),
    );
  }
}
