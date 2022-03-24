// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/presentation/onboarding/widgets/layout/circles.dart';
import 'package:xplore/presentation/onboarding/widgets/xplore_appbar.dart';

class KeyboardScaffold extends StatefulWidget {
  final Function? onLeadingTap;
  final List<Widget>? actions;
  final List<Widget> widgets;

  const KeyboardScaffold({
    Key? key,
    this.onLeadingTap,
    this.actions,
    required this.widgets,
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
      appBar: XploreAppbar(
        onLeadingtap: () => widget.onLeadingTap,
        actions: widget.actions ??
            [
              InkWell(
                key: ValueKey('XploreAppbar_action1'),
                onTap: () {},
                child: Icon(
                  Icons.admin_panel_settings,
                  color: XploreColors.orange,
                ),
              ),
              hSize30SizedBox
            ],
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
