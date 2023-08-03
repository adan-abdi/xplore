import 'package:flutter_test/flutter_test.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';

void main() {
  late AuthController authController;

  //  setting up instance of controller
  setUpAll(() {
    Get.put(() => AuthController());
    
    authController = Get.find<AuthController>();
  });

  group('Testing Different Phone Number Inputs', () {
    
    test('Phone number that starts with 0 is valid', () {

    });
    
  });
}
