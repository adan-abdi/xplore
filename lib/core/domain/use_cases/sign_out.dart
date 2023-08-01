import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

class SignOut {
  final repository = locator.get<AuthRepository>();

  Future<void> call() async => await repository.signOut();
}