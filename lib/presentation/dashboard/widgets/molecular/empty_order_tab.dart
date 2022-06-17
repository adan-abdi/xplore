// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/domain/value_objects/app_strings.dart';
import 'package:shamiri/presentation/core/widgets/xplore_loader.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          XploreLoader(),
          vSize10SizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Text(emptyOrderTabPromptFirst,
                textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
