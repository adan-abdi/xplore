// Package imports:
import 'package:rxdart/rxdart.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';

class ProductListingStatus {
  factory ProductListingStatus() {
    return _singleton;
  }

  ProductListingStatus._internal();

  final productState = BehaviorSubject<ProductListingStates>.seeded(ProductListingStates.shimmer);

  static final ProductListingStatus _singleton = ProductListingStatus._internal();
}
