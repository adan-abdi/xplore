import 'package:shamiri/core/domain/repository/core_repository.dart';
import 'package:shamiri/di/locator.dart';

import '../../model/version_model.dart';

class GetPackageDetails {
  final repository = locator.get<CoreRepository>();

  Future<VersionModel> call() async => await repository.getPackageDetails();
}