import 'package:flutter/material.dart';
import 'package:xplore_origin/application/core/themes/app_themes.dart';
import 'package:xplore_origin/domain/core/value_objects/app_spaces.dart';
import 'package:xplore_origin/domain/core/value_objects/app_strings.dart';
import 'package:xplore_origin/presentation/core/widgets/xplore_appbar.dart';
import 'package:xplore_origin/presentation/core/widgets/xplore_grid.dart';

class XploreAppRoot extends StatelessWidget {
  const XploreAppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: XploreAppBar(title: XploreOriginStrings.appName),
        body: Column(
          children: [
            Center(
              child: Text(
                XploreOriginStrings.rootPage,
                style: XploreOriginThemes()
                    .textThemes(color: XploreOriginThemes.black),
              ),
            ),
            XploreSpaces.hSize20SizeBox,
            XploreGrid(),
          ],
        ),
      ),
    );
  }
}
