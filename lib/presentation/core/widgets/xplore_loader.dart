import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xplore/domain/value_objects/app_asset_strings.dart';

class XploreLoader extends StatelessWidget {
  const XploreLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        xploreLoader,
        repeat: true,
      ),
    );
  }
}
