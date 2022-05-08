// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:shamiri/domain/value_objects/app_asset_strings.dart';

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
