import 'package:shamiri/core/domain/use_cases/core/pick_image.dart';

import 'get_package_details.dart';

class CoreUseCases {
  final PickImage pickImage;
  final GetPackageDetails getPackageDetails;

  CoreUseCases({required this.pickImage, required this.getPackageDetails});
}
