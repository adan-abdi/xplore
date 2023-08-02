import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class CoreRepository {

  /// Pick Image from Gallery
  Future<void> pickImage(
      {required ImageSource source, required Function(File? file) imageFile});
}