import 'package:hive/hive.dart';
import 'package:shamiri/core/domain/model/user_model.dart';

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

  /// User Data
  @HiveField(2, defaultValue: null)
  final UserModel? userModel;

  UserPrefs({this.isLoggedIn, this.isProfileCreated, this.userModel});
}
