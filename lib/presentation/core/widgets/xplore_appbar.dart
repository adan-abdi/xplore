import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/app_themes.dart';
import 'package:xplore/domain/value_objects/app_magic_numbers.dart';

class XploreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? appbarColor;
  final Color? titleColor;
  final bool isTitleCenter = true;

  const XploreAppBar(
      {Key? key, required this.title, this.appbarColor, this.titleColor})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: XploreOriginNumbers.number80,
      title: Text(
        title,
        style:
            XploreThemes().textThemes(color: titleColor ?? XploreThemes.white),
      ),
      backgroundColor: appbarColor,
      centerTitle: isTitleCenter,
    );
  }
}
