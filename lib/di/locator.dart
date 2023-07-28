import 'package:get_it/get_it.dart';
import 'package:shamiri/di/firebase_di.dart';

var locator = GetIt.instance;

void invokeDependencies() {
  firebaseDI(locator: locator);
}