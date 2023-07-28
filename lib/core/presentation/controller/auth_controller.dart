import 'package:get/get.dart';
import 'package:shamiri/core/domain/use_cases/auth_use_cases.dart';
import 'package:shamiri/di/locator.dart';

class AuthController extends GetxController {

  final authUseCases = locator.get<AuthUseCases>();
}