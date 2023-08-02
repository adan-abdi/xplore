import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shamiri/core/domain/repository/core_repository.dart';

class CoreRepositoryImpl extends CoreRepository {

  @override
  Future<void> pickImage({required ImageSource source, required Function(File? file) imageFile}) async {
    try {
      final myImage = await ImagePicker().pickImage(source: source);

      if (myImage == null) {
        imageFile(null);
        return;
      }

      File? img = File(myImage.path);
      imageFile(img);
      
    } on Exception catch (error) {
      throw Exception(error);
    }
  }
}