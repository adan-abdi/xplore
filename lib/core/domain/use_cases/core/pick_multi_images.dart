import 'dart:io';

import 'package:shamiri/core/domain/repository/core_repository.dart';
import 'package:shamiri/core/domain/use_cases/core/core_use_cases.dart';
import 'package:shamiri/di/locator.dart';

class PickMultiImages {
  final repo = locator.get<CoreRepository>();

  Future<void> call({required Function(List<File>? files) imageFiles}) async =>
      await repo.pickMultiImage(imageFiles: imageFiles);
}
