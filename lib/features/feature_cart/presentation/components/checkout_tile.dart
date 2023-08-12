import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CheckoutTile extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final IconData iconData;
  final Widget content;

  const CheckoutTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.iconData,
      required this.content});

  @override
  State<CheckoutTile> createState() => _CheckoutTileState();
}

class _CheckoutTileState extends State<CheckoutTile> {
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
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
    );
  }
}
