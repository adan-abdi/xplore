// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/presentation/core/widgets/xplore_card.dart';

class XploreAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  final bool isWidgetActive;
  final String title;
  final XploreIconCard? leadingIcon;
  final XploreIconCard? firstAction;
  final IconButton? lastAction;
  final bool expanded;
  final Color? backgroundColor;
  final double? elevation;

  const XploreAppBar({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: isWidgetActive ? XploreColors.deepBlue : XploreColors.white),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor ?? XploreColors.deepBlue,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      leading: leadingIcon ??
          XploreIconCard(
              icon: Icons.arrow_back,
              iconOnPress: () {
                Navigator.pop(context);
              }),
      actions: [
        Container(child: firstAction),
      ],
      bottom: expanded ? XploreAppbarBottom() : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}

class XploreAppbarBottom extends StatelessWidget with PreferredSizeWidget {
  const XploreAppbarBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepOrange, width: .0),
            borderRadius: BorderRadius.circular(5),
          ),
          border: new OutlineInputBorder(
            borderSide: new BorderSide(
              color: Colors.deepOrange,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.deepOrange,
          ),
          hintText: "Search",
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
