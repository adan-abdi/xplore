import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shamiri/core/presentation/components/hamburger.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HamburgerMenuBtn(onTap: () {
      ZoomDrawer.of(context)!.toggle();
    });
  }
}
