// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/presentation/onboarding/widgets/layout/circles.dart';

class KeyboardScaffold extends StatefulWidget {
  final IconData? trailingActionIcon;
  final List<Widget> widgets;
  final bool isSecondary;

  const KeyboardScaffold({
    Key? key,
    required this.widgets,
    this.isSecondary = false,
    this.trailingActionIcon = Icons.settings,
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
      appBar: AppBar(
        backgroundColor: XploreColors.white,
        elevation: 0,
        leading: widget.isSecondary
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: XploreColors.deepBlue,
                  ),
                ),
              )
            : SizedBox.shrink(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(widget.trailingActionIcon),
            color: XploreColors.orange,
          ),
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
