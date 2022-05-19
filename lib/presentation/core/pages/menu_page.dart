// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/presentation/core/widgets/xplore_appbar.dart';
import 'package:shamiri/presentation/core/widgets/xplore_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.whiteSmoke,
      appBar: XploreAppBar(
        backgroundColor: XploreColors.whiteSmoke,
        leadingIcon: XploreIconCard(
          icon: Icons.menu,
          iconColor: XploreColors.deepBlue,
          iconOnPress: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        elevation: 0,
      ),
    );
  }
}
