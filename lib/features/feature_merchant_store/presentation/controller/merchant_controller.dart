import 'dart:io';

import 'package:get/get.dart';

class MerchantController extends GetxController {

  final productPic = Rxn<File>();

  void setProductPic({required File file}) => productPic.value = file;
}