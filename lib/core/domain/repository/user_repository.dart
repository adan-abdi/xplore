import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:shamiri/core/domain/model/user_prefs.dart';

abstract class UserRepository {
  /// Add User Preferences
  Future<void> addUserPrefs({required UserPrefs userPrefs});

  /// Get User Preferences
  Future<UserPrefs> getUserPrefs();

  /// Update User Preferences
  Future<void> updateUserPrefs({required UserPrefs userPrefs});

  /// Delete User Preferences
  Future<void> deleteUserPrefs();
}