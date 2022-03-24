// Package imports:
import 'package:rxdart/rxdart.dart';
import 'package:xplore/domain/routes/routes.dart';

class InitialRouteStore {
  factory InitialRouteStore() {
    return _singleton;
  }

  InitialRouteStore._internal();

  //Route
  final initialRoute = BehaviorSubject<String>.seeded(landingPageRoute);

  static final InitialRouteStore _singleton = InitialRouteStore._internal();
}
