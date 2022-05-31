// Package imports:
import 'package:rxdart/rxdart.dart';

class SearchStatus {
  factory SearchStatus() {
    return _singleton;
  }

  SearchStatus._internal();

  final searchTerm = BehaviorSubject<String>.seeded('');

  static final SearchStatus _singleton = SearchStatus._internal();
}
