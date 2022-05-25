// Package imports:
import 'package:rxdart/rxdart.dart';

class SlidingTabStatusStore {
  factory SlidingTabStatusStore() {
    return _singleton;
  }

  SlidingTabStatusStore._internal();

  final activeTabState = BehaviorSubject<int>.seeded(0);

  static final SlidingTabStatusStore _singleton =
      SlidingTabStatusStore._internal();
}
