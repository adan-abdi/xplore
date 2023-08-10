import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TransactionTile extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final IconData iconData;
  final Widget content;

  const TransactionTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.iconData,
      required this.content});

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TimelineTile(
        isFirst: widget.isFirst,
        isLast: widget.isLast,
        beforeLineStyle: LineStyle(color: widget.isPast ? XploreColors.deepBlue : XploreColors.deepBlueLight),
        indicatorStyle: IndicatorStyle(
          width: 30,
          height: 30,
          indicatorXY: 0,
          color: widget.isPast ? XploreColors.deepBlue : XploreColors.deepBlueLight,
          iconStyle: IconStyle(iconData: widget.iconData, color: XploreColors.white)
        ),
        endChild: widget.content,
      ),
    );
  }
}
