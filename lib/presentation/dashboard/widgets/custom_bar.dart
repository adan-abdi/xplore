// Flutter imports:
import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/domain/value_objects/app_global_constants.dart';

// Project imports:
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/presentation/core/widgets/xplore_card.dart';

class XploreAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool isActive;
  final bool isSecondary;
  final bool shouldExpand;
  final IconData leadingActionIcon;
  final Function() leadingIconTapFn;
  final String appBarTitle;
  final IconData? trailingActionIcon;
  final Function()? trailingActionTapFn;
  final bool actionsWithElevation;

  const XploreAppBar({
    Key? key,
    required this.leadingIconTapFn,
    this.leadingActionIcon = Icons.keyboard_backspace,
    this.appBarTitle = '',
    this.trailingActionIcon,
    this.trailingActionTapFn,
    this.isActive = true,
    this.isSecondary = true,
    this.shouldExpand = true,
    this.actionsWithElevation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: isActive ? XploreColors.deepBlue : XploreColors.white,
      elevation: isActive ? 5 : 0,
      centerTitle: true,
      // floating: true,
      // stretch: true,
      expandedHeight: 150,
      leading: 
          XploreIconCard(
              icon: leadingActionIcon,
              iconOnPress: leadingIconTapFn,
              withElevation: actionsWithElevation,
              iconColor: isActive ? XploreColors.deepBlue : XploreColors.orange,
            ),
          // : SizedBox.shrink(),
      title: Text(
        appBarTitle,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
      ),
      actions: <Widget>[
        // (trailingActionIcon != null)
        XploreIconCard(
          icon: trailingActionIcon ?? Icons.rocket,
          iconOnPress: leadingIconTapFn,
          withElevation: actionsWithElevation,
          iconColor: isActive ? XploreColors.deepBlue : XploreColors.orange,
        ),
                // : SizedBox.shrink(),
            //     (trailingActionIcon != null)
            // ? hSize30SizedBox
            // : SizedBox.shrink(),
      ],
      flexibleSpace: FlexibleSpaceBar(
        // stretchModes: const <StretchMode>[
        //   StretchMode.zoomBackground,
        //   StretchMode.blurBackground,
        //   StretchMode.fadeTitle,
        // ],
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20.0),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.deepOrange, width: .0),
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(shouldExpand ? 150 : 150);
}
