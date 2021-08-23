import 'dart:io' as io;
import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:xplore/infrastructure/repository/initialize_db.dart';
import 'package:xplore/presentation/core/xplore.dart';

/// For a little bit more context on the concept of `Mocking`, take a look at
/// [this stack overflow question](https://stackoverflow.com/a/40244095/6322723)
///

class MockHttpClientIO extends Mock implements io.HttpClient {}

class MockHttpClientRequest extends Mock implements io.HttpClientRequest {}

class MockHttpClientResponse extends Mock implements io.HttpClientResponse {}

class MockHttpHeaders extends Mock implements io.HttpHeaders {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBuildContext extends Mock implements BuildContext {}

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {
  @override
  Future<void> logEvent(
      {required String name, Map<String, Object?>? parameters}) {
    return Future<void>.value();
  }
}

const String mockImagePath = './image.jpg';

class MockFormState extends Mock implements FormState {
  MockFormState({required this.validation});

  final bool validation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return super.toString();
  }

  @override
  bool validate() => validation;

  @override
  Form get widget {
    return Form(child: Container());
  }
}

// ignore: must_be_immutable
class GlobalKeyMock extends Mock implements GlobalKey<MockFormState> {
  GlobalKeyMock({this.mockFormState});

  final MockFormState? mockFormState;

  @override
  MockFormState? get currentState => mockFormState;
}

typedef OnObservation = void Function(
    Route<dynamic>? route, Route<dynamic>? previousRoute);

class TestNavigatorObserver extends NavigatorObserver {
  TestNavigatorObserver({this.onPop, this.onPush});

  final OnObservation? onPop;
  final OnObservation? onPush;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      onPop?.call(route, previousRoute);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPush?.call(route, previousRoute);
  }
}

final Route<dynamic> testRoute = MaterialPageRoute<dynamic>(
  builder: (_) => XploreAppRoot(),
);

/// Please refer to:
///
///  https://developer.android.com/training/multiscreen/screendensities#dips-pels
const Size typicalPhoneScreenSizePortrait = Size(320, 480);
const Size typicalPhoneScreenSizeLandscape = Size(480, 320);

/// Please refer to:
///  https://developer.android.com/training/multiscreen/screendensities#dips-pels
const Size mediumSizedTabletPortrait = Size(600, 1024);
const Size mediumSizedTabletLandscape = Size(1024, 600);

const Size tabletPortrait = Size(720, 1280);
const Size tabletLandscape = Size(1280, 720);

class MockInitializeDB extends Mock implements InitializeDB<MockStateDB> {
  @override
  Future<MockStateDB> database({MockStateDB? preInitializedDB}) =>
      super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<MockStateDB>.value(MockStateDB()))
          as Future<MockStateDB>;

  @override
  String get dbName =>
      super.noSuchMethod(Invocation.getter(#dbName), returnValue: 'testDb')
          as String;
}

class MockStateDB extends Mock implements Database {
  @override
  Batch batch() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeMethod<T>(String method, [dynamic arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeSqlMethod<T>(String method, String sql,
      [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> getVersion() {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(String table, Map<String, Object?> values,
      {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawInsert, <dynamic>[sql, arguments]),
        returnValue: Future<int>.value(10),
      ) as Future<int>;

  @override
  Future<List<Map<String, Object?>>> rawQuery(String sql,
          [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawQuery, <dynamic>[sql, arguments]),
        returnValue: Future<List<Map<String, Object?>>>.value(
          <Map<String, Object?>>[
            <String, Object?>{'miscState': 10}
          ],
        ),
      ) as Future<List<Map<String, Object?>>>;

  @override
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> setVersion(int version) {
    throw UnimplementedError();
  }

  @override
  Future<T> transaction<T>(Future<T> Function(Transaction txn) action,
      {bool? exclusive}) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(String table, Map<String, Object?> values,
      {String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }
}

String testPath(String relativePath) {
  final Directory current = Directory.current;
  final String path =
      current.path.endsWith('/test') ? current.path : '${current.path}/test';

  return '$path/$relativePath';
}
