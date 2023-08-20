import 'package:shamiri/core/domain/use_cases/core/pick_image.dart';
import 'package:shamiri/core/domain/use_cases/core/pick_multi_images.dart';

import 'get_package_details.dart';

class CoreUseCases {
  final PickImage pickImage;
  final PickMultiImages pickMultiImages;
  final GetPackageDetails getPackageDetails;

  CoreUseCases(
      {required this.pickImage,
      required this.pickMultiImages,
      required this.getPackageDetails});
}
