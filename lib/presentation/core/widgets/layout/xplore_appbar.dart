// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/application/singletons/product_listing_status.dart';
import 'package:shamiri/application/singletons/search_state.dart';
import 'package:shamiri/presentation/core/widgets/molecular/appbar_search.dart';
import 'package:shamiri/presentation/core/widgets/xplore_card.dart';

PreferredSizeWidget XploreBar(
{required bool automaticallyImplyLeading,
  required bool isWidgetActive,
  required String title,
  XploreIconCard? leadingIcon,
  XploreIconCard? firstAction,
  XploreIconCard? lastAction,
  required bool expanded,
  required bool centerTitle,
  Color? backgroundColor,
  double? elevation,
  required SearchStatus searchStatus,
  required ProductListingStatus productListingStatus,}
) =>
    AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: isWidgetActive ? XploreColors.deepBlue : XploreColors.white),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? XploreColors.deepBlue,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: (!automaticallyImplyLeading)
          ? leadingIcon
          : XploreIconCard(
              icon: Icons.arrow_back,
              iconOnPress: () {
                // Navigator.pop(context);
              }),
      actions: [
        Container(child: firstAction),
        Container(child: lastAction),
      ],
      elevation: elevation,
    );

// ignore: must_be_immutable
class XploreAppBar extends StatelessWidget {
  final bool automaticallyImplyLeading;
  final bool isWidgetActive;
  final String title;
  final XploreIconCard? leadingIcon;
  final XploreIconCard? firstAction;
  final XploreIconCard? lastAction;
  final bool expanded;
  final bool centerTitle;
  final Color? backgroundColor;
  final double? elevation;
  SearchStatus searchStatus;
  ProductListingStatus productListingStatus;

  XploreAppBar({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.title = '',
    this.leadingIcon,
    this.firstAction,
    this.lastAction,
    this.expanded = false,
    this.backgroundColor,
    this.elevation,
    this.isWidgetActive = false,
    this.centerTitle = true,
    required this.searchStatus,
    required this.productListingStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: isWidgetActive ? XploreColors.deepBlue : XploreColors.white),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? XploreColors.deepBlue,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: (!automaticallyImplyLeading)
          ? leadingIcon
          : XploreIconCard(
              icon: Icons.arrow_back,
              iconOnPress: () {
                Navigator.pop(context);
              }),
      actions: [
        Container(child: firstAction),
        Container(child: lastAction),
      ],
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize =>
      expanded ? Size.fromHeight(130) : Size.fromHeight(56);
}
