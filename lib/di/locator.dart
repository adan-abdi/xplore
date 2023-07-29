import 'package:get_it/get_it.dart';
import 'package:shamiri/core/di/auth_di.dart';
import 'package:shamiri/core/di/core_di.dart';
import 'package:shamiri/di/firebase_di.dart';

var locator = GetIt.instance;

void invokeDependencies() {
  firebaseDI(locator: locator);
  authDI(locator: locator);
  coreDI(locator: locator);
}