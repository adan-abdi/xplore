import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../model/version_model.dart';

abstract class CoreRepository {
  /// Get Package Details
  Future<VersionModel> getPackageDetails();

  /// Pick Image from Gallery
  Future<void> pickImage(
      {required ImageSource source, required Function(File? file) imageFile});

  /// Pick Multiple Images from Gallery
  Future<void> pickMultiImage(
      {required Function(List<File>? files) imageFiles});
}
