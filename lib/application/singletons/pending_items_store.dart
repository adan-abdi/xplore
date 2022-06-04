// Package imports:
import 'package:rxdart/rxdart.dart';

class OrdersStore {
  factory OrdersStore() {
    return _singleton;
  }

  OrdersStore._internal();

  final pendingItems = BehaviorSubject<List<String>>.seeded(['']);

  static final OrdersStore _singleton = OrdersStore._internal();
}
