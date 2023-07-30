import 'package:hive/hive.dart';

/// flutter packages pub run build_runner build
part 'user_prefs.g.dart';

@HiveType(typeId: 0)
class UserPrefs {
  /// Is Signed In
  @HiveField(0, defaultValue: false)
  final bool? isLoggedIn;

  /// Is Profile created
  @HiveField(1, defaultValue: false)
  final bool? isProfileCreated;

  UserPrefs({this.isLoggedIn, this.isProfileCreated});
}
