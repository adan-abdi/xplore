import 'package:flutter_test/flutter_test.dart';
import 'package:xplore/infrastructure/database_base.dart';
import 'package:xplore/infrastructure/migrations.dart';

void main() {
  group('XploreDatabaseBase', () {
    test('Tables enum returns correct values', () {
      expect(Tables.userState.name, 'userState');
    });

    test('migrations', () {
      expect(migrations, isA<List<String>>());
      expect(migrations.length, 1);
    });
  });
}
