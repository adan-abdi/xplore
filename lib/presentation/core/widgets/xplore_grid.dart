import 'package:flutter/material.dart';
import 'package:xplore/application/core/themes/app_themes.dart';
import 'package:xplore/domain/value_objects/app_magic_numbers.dart';

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
              width: xploreRootCardSize,
              height: xploreRootCardSize,
              child: Card(
                elevation: size5,
                child: Center(
                  child: Text(
                    'module',
                    style: XploreThemes().textThemes(color: XploreThemes.black),
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
