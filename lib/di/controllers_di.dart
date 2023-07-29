import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/presentation/controller/core_controller.dart';

void initializeControllers() {
  Get.lazyPut(() => AuthController(), fenix: true);
  Get.lazyPut(() => CoreController(), fenix: true);
}
