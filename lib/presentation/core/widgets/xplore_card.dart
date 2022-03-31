import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';

class XploreIconCard extends StatelessWidget {
  final IconData icon;
  final Function() iconOnPress;
  final Color? iconColor;
  final bool withElevation;

  const XploreIconCard({
    Key? key,
    required this.icon,
    required this.iconOnPress,
    this.iconColor, this.withElevation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: rWidth(context, 8),
      // height: rWidth(context, 8),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => iconOnPress(),
        child: Card(
          borderOnForeground: false,
          semanticContainer: false,
          elevation: withElevation ? 5 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Icon(
            icon,
            color: iconColor ?? XploreColors.orange,
          ),
        ),
      ),
    );
  }
}
