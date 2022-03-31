// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/presentation/dashboard/widgets/custom_bar.dart';
import 'package:xplore/presentation/onboarding/widgets/layout/circles.dart';

class KeyboardScaffold extends StatefulWidget {
  final IconData? trailingActionIcon;
  final Function? onLeadingTap;
  final List<Widget> widgets;
  final bool isSecondary;

  const KeyboardScaffold({
    Key? key,
    this.onLeadingTap,
    required this.widgets,
    this.isSecondary = false, this.trailingActionIcon = Icons.settings,
  }) : super(key: key);

  @override
  _KeyboardScaffoldState createState() => _KeyboardScaffoldState();
}

class _KeyboardScaffoldState extends State<KeyboardScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XploreAppBar(
        isActive: false,
        isSecondary: widget.isSecondary,
        shouldExpand: false,
        leadingIconTapFn: widget.isSecondary
            ? () {
                Navigator.pop(context);
              }
            : () {},
        trailingActionIcon: widget.trailingActionIcon,
        actionsWithElevation: false,
      ),
      body: Stack(
        children: <Widget>[
          ...circles(context, XploreColors.white),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.widgets,
          ),
        ],
      ),
    );
  }
}
