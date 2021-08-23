import 'package:xplore/infrastructure/repository/database_base.dart';

final List<String> migrations = <String>[
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.onboardingState.name} (id INTEGER PRIMARY KEY,
          onboardingState TEXT)''',
];
