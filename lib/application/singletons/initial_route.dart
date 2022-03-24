// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:xplore/domain/routes/routes.dart';

class InitialRouteStore {
  factory InitialRouteStore() {
    return _singleton;
  }

  InitialRouteStore._internal();

  //Route
  final initialRoute = BehaviorSubject<String>.seeded('');

  static final InitialRouteStore _singleton = InitialRouteStore._internal();
}
