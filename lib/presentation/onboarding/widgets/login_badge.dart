// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';

class LandingBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: XploreColors.white,
      ),
      child: Icon(
        Icons.admin_panel_settings,
        size: 90,
        color: XploreColors.orange,
      ),
    );
  }
}
