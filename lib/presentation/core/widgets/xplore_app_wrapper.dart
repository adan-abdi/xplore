// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

class XploreWrapper extends InheritedWidget {
  const XploreWrapper({
    Key? key,
    required Widget child,
    required this.store,
  }) : super(key: key, child: child);

  final Store store;

  static XploreWrapper of(BuildContext context) {
    final XploreWrapper? store =
        context.dependOnInheritedWidgetOfExactType<XploreWrapper>();
    assert(store != null, 'No Store found in context');
    return store!;
  }

  @override
  bool updateShouldNotify(XploreWrapper old) => store != old.store;
}
