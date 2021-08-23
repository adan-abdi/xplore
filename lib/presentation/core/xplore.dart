import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/app_themes.dart';
import 'package:xplore/domain/core/value_objects/app_spaces.dart';
import 'package:xplore/domain/core/value_objects/app_strings.dart';

class XploreAppRoot extends StatelessWidget {
  const XploreAppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            XploreOriginStrings.appName,
            style: XploreThemes().textThemes(color: XploreThemes.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            XploreSpaces.hSize20SizeBox,
          ],
        ),
      ),
    );
  }
}
