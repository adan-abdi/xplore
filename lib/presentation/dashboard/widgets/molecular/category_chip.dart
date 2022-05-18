// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';

class CategoryChip extends StatelessWidget {
  final String name;

  const CategoryChip({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryInitial = name[0];

    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: XploreColors.white,
        child: Text(categoryInitial),
      ),
      label: Text(
        name,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: XploreColors.deepBlueAccent,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}
