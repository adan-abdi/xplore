// Project imports:

// Project imports:
import 'package:xplore/infrastructure/local/database_base.dart';

final List<String> migrations = <String>[
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.userState.name} (id INTEGER PRIMARY KEY,
          userState TEXT)''',
];
