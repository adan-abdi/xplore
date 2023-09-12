import 'package:shamiri/core/domain/repository/auth_repository.dart';
import 'package:shamiri/di/locator.dart';

class DeleteAccount {
  final repository = locator.get<AuthRepository>();

  Future<void> call() async => await repository.deleteAccount();
}
