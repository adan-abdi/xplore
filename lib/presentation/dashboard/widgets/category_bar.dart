// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';

class CategoryBar extends StatelessWidget {
  final int categoryCount;

  const CategoryBar({Key? key, required this.categoryCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [...categoryChips(categoryCount)],
      ),
    );
  }
}

List<Chip> categoryChips(count) {
  List<Chip> categoryWidgets = [];
  for (var i = 0; i >= count; i++) {
    categoryWidgets.add(
      Chip(
        labelPadding: EdgeInsets.all(2.0),
        avatar: CircleAvatar(
          backgroundColor: XploreColors.white,
          child: Text('F'),
        ),
        label: Text(
          'Foodstuffs',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: XploreColors.deepBlueAccent,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
  return categoryWidgets;
}
