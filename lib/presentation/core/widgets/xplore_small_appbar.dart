// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/app_themes.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_global_constants.dart';

class XploreSmallAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Icon? leadingIcon;
  final String? title;
  final Color? appbarColor;
  final Color? titleColor;
  final bool isTitleCenter = true;
  final List<Widget>? actions;
  final Function? onLeadingTap;

  const XploreSmallAppbar(
      {Key? key, this.leadingIcon, this.title, this.appbarColor, this.titleColor, this.actions, this.onLeadingTap})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(xploreAppbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        key: ValueKey('XploreAppbar_leadingIcon'),
        child: leadingIcon ??
            Icon(
              Icons.keyboard_backspace,
              color: XploreColors.black,
            ),
        onTap: () => onLeadingTap,
      ),
      title: Text(
        title ?? '',
        style: XploreThemes().textThemes(color: titleColor ?? XploreThemes.white),
      ),
      backgroundColor: appbarColor ?? XploreColors.white,
      centerTitle: isTitleCenter,
      elevation: 0,
      actions: actions ?? [SizedBox.shrink()],
    );
  }
}
