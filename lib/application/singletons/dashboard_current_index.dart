// Package imports:
import 'package:rxdart/rxdart.dart';

class DashboardIndexStatusStore {
  factory DashboardIndexStatusStore() {
    return _singleton;
  }

  DashboardIndexStatusStore._internal();

  final currentIndex = BehaviorSubject<int>.seeded(0);

  static final DashboardIndexStatusStore _singleton =
      DashboardIndexStatusStore._internal();
}
