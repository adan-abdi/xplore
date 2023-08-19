import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shamiri/core/domain/repository/core_repository.dart';

import '../../domain/model/version_model.dart';

class CoreRepositoryImpl extends CoreRepository {

  @override
  Future<VersionModel> getPackageDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String buildNumber = packageInfo.buildNumber;
    String version = packageInfo.version;

    return VersionModel(
        appName: appName,
        buildNumber: buildNumber,
        packageName: packageName,
        version: version);
  }

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