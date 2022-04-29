// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/domain/value_objects/app_asset_strings.dart';

class LandingVector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 230,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(landingVectorImage),
        ),
      ),
    );
  }
}
