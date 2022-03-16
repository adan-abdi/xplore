// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xplore/domain/value_objects/app_spaces.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_page.dart';

class PageCard extends StatelessWidget {
  final PageData page;

  const PageCard({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: <Widget>[
          hHalf(context),
          Icon(
            page.icon,
            size: 120,
            color: page.textColor,
          ),
          vSize30SizedBox,
          _buildText(context),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      page.title!,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }
}
