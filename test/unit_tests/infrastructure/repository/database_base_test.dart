import 'package:flutter_test/flutter_test.dart';
import 'package:xplore/infrastructure/repository/database_base.dart';
import 'package:xplore/infrastructure/repository/migrations.dart';

void main() {
  group('XploreDatabaseBase', () {
    test('Tables enum returns correct values', () {
      expect(Tables.onboardingState.name, 'onboardingState');
    });

    test('migrations', () {
      expect(migrations, isA<List<String>>());
      expect(migrations.length, 1);
    });
  });
}
