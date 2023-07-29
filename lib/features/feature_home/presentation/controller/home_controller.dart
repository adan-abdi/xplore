import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Active Bottom Bar Index
  final activeBottomBarIndex = 0.obs;

  void setActiveBottomBarIndex(int index) =>
      activeBottomBarIndex.value = index;
}
