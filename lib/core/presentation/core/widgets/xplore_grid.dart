import 'package:flutter/material.dart';
import 'package:xplore_origin/core/application/core/themes/app_themes.dart';
import 'package:xplore_origin/core/domain/core/value_objects/app_magic_numbers.dart';

class XploreGrid extends StatelessWidget {
  const XploreGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: XploreOriginNumbers.xploreRootCardSize,
              height: XploreOriginNumbers.xploreRootCardSize,
              child: Card(
                elevation: XploreOriginNumbers.size5,
                child: Center(
                  child: Text(
                    'module',
                    style: XploreOriginThemes()
                        .textThemes(color: XploreOriginThemes.black),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
