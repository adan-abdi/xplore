import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shamiri/core/domain/repository/core_repository.dart';
import 'package:shamiri/di/locator.dart';

class PickImage {
  final repository = locator.get<CoreRepository>();

  Future<void> call(
          {required ImageSource source,
          required Function(File? file) imageFile}) async =>
      await repository.pickImage(source: source, imageFile: imageFile);
}
