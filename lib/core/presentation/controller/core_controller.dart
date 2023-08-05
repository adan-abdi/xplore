import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamiri/core/domain/use_cases/core/core_use_cases.dart';
import 'package:shamiri/di/locator.dart';

class CoreController extends GetxController {
  final useCases = locator.get<CoreUseCases>();

  final userProfilePic = Rxn<File>();

  void setProfilePic({required File? file}) => userProfilePic.value = file;

  Future pickImage(
      {required ImageSource source, required Function(File file) imageFile}) async {
    return useCases.pickImage.call(
        source: source,
        imageFile: (file) {
          //  save file to image
          if (file != null) {
            imageFile(file);
          }
        });
  }
}
