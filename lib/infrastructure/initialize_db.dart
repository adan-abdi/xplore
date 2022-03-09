import 'package:sqflite/sqflite.dart';
import 'package:xplore/infrastructure/sqlite.dart';

class InitializeDB<T extends DatabaseExecutor> extends InitializeDBHelper<T> {
  InitializeDB({
    required String dbName,
  }) : super(dbName: dbName);
}

abstract class InitializeDBHelper<T extends DatabaseExecutor> {
  final String dbName;
  InitializeDBHelper({required this.dbName});

  Future<T> database({T? preInitializedDB}) async {
    if (preInitializedDB != null) {
      return Future<T>.value(preInitializedDB);
    } else {
      return initDatabase<T>(dbName);
    }
  }
}
