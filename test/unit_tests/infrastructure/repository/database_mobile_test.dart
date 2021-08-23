import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:xplore/infrastructure/repository/database_base.dart';
import 'package:xplore/infrastructure/repository/database_mobile.dart';
import 'package:xplore/infrastructure/repository/initialize_db.dart';

import '../../../mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final MockStateDB mockDb = MockStateDB();

  final MockInitializeDB initDb = MockInitializeDB();

  when(initDb.database()).thenAnswer(
      (Invocation realInvocation) => Future<MockStateDB>.value(mockDb));

  final XploreDatabaseMobile<MockStateDB> db =
      XploreDatabaseMobile<MockStateDB>(initializeDB: initDb);

  Future<List<Map<String, Object?>>> returnVal(int count) =>
      Future<List<Map<String, Object?>>>.value(
        <Map<String, Object?>>[
          <String, Object?>{'users': count}
        ],
      );

  test('should call initialize and clear database : mock', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(
        () => InitializeDB<MockStateDB>(dbName: 'test_db')
            .database(preInitializedDB: mockDb),
        returnsNormally);

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    final XploreDatabaseMobile<MockStateDB> _db =
        XploreDatabaseMobile<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test('should throw exception on real state db. Missing plugin', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db').database(),
        throwsException);

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    final XploreDatabaseMobile<MockStateDB> _db =
        XploreDatabaseMobile<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test(
      'countTableRecords should return 0 entries when checking onboardingState',
      () async {
    when(mockDb.rawQuery('SELECT COUNT(*) FROM onboardingState'))
        .thenAnswer((_) async => returnVal(1));

    expect(await db.countTableRecords(Tables.onboardingState), 1);
  });

  group('isDatabaseEmpty', () {
    void buildWhenMock(String arg, int count) {
      when(mockDb.rawQuery('SELECT COUNT(*) FROM $arg'))
          .thenAnswer((_) => returnVal(count));
    }

    test('isDatabaseEmpty should return false', () async {
      buildWhenMock('miscState', 10);
      buildWhenMock('userFeedState', 10);
      buildWhenMock('userState', 10);
      buildWhenMock('clinicalState', 10);
      buildWhenMock('navigationState', 10);
      buildWhenMock('kycState', 10);
      buildWhenMock('coversState', 10);
      expect(await db.isDatabaseEmpty(), false);
    });

    test('isDatabaseEmpty should return true', () async {
      buildWhenMock('onboardingState', 0);
      expect(await db.isDatabaseEmpty(), true);
    });
  });
}
