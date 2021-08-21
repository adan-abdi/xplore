import 'package:flutter/material.dart';
import 'package:xplore_origin/application/core/themes/app_themes.dart';

class XploreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? appbarColor;
  final Color? titletColor;
  final bool isTitleCenter = true;

  const XploreAppBar(
      {Key? key, required this.title, this.appbarColor, this.titletColor})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: XploreOriginThemes()
            .textThemes(color: titletColor ?? XploreOriginThemes.white),
      ),
      backgroundColor: appbarColor,
      centerTitle: isTitleCenter,
    );
  }
}
