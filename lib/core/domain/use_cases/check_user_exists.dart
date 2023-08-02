import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

class CheckUserExists {
  final repository = locator.get<AuthRepository>();

  Future<bool> call({required String uid}) async =>
      repository.checkUserExists(uid: uid);
}
