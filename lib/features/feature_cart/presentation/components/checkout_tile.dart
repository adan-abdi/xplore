import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CheckoutTile extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;

  const CheckoutTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast});

  @override
  State<CheckoutTile> createState() => _CheckoutTileState();
}

class _CheckoutTileState extends State<CheckoutTile> {
  @override
  Widget build(BuildContext context) {
    return TimelineTile();
  }
}
